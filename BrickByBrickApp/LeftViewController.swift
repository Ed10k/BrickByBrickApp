//
//  LeftViewController.swift
//  BrickByBrickApp
//
//  Created by Newcomer, Grayson on 3/17/23.
//

import UIKit

class LeftViewController: UIViewController {
 

    @IBOutlet weak var timerLabel: UILabel!
    
    @IBOutlet weak var progressView: UIView!
    
    var timer: Timer?
    var timeLeft = 3600
    var minutesLeft = 60
    var secondsLeft = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let circleLayer = CAShapeLayer()
            let radius = (progressView.frame.width - 10) / 2
            let center = CGPoint(x: progressView.frame.width / 2, y: progressView.frame.height / 2)
            let circlePath = UIBezierPath(arcCenter: center, radius: radius, startAngle: -CGFloat.pi / 2, endAngle: 2 * CGFloat.pi - CGFloat.pi / 2, clockwise: true)
            circleLayer.path = circlePath.cgPath
            circleLayer.fillColor = UIColor.clear.cgColor
            circleLayer.strokeColor = UIColor.blue.cgColor
            circleLayer.lineWidth = 10
            circleLayer.strokeEnd = 1
            progressView.layer.addSublayer(circleLayer)
    }
    
    

    
    @IBAction func didTapStartButt(_ sender: Any) {
        startTimer()
    }
    
    
    @IBAction func didTapStopButt(_ sender: UIButton) {
        let alert = UIAlertController(title: "Stop Timer?", message: "Are you sure you want to stop the timer?", preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        let stopAction = UIAlertAction(title: "Stop", style: .destructive, handler: { [weak self] (_) in
                self?.stopTimer()
        })
            alert.addAction(cancelAction)
            alert.addAction(stopAction)
            present(alert, animated: true, completion: nil)
    }

    
    
    
    
    func updateTimer() {
        timeLeft -= 1
        minutesLeft = timeLeft / 60
        secondsLeft = timeLeft % 60
        timerLabel.text = String(format: "%02d:%02d", minutesLeft, secondsLeft)
        
        if timeLeft == 0 {
            timer?.invalidate()
            timer = nil
        }
    }

    func startTimer() {
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [weak self] (_) in
            guard let self = self else { return }
            
            if self.timeLeft > 0 {
                self.timeLeft -= 1
                self.minutesLeft = self.timeLeft / 60
                self.secondsLeft = self.timeLeft % 60
                self.timerLabel.text = String(format: "%02d:%02d", self.minutesLeft, self.secondsLeft)
                
                // Update progress bar
                let circleLayer = self.progressView.layer.sublayers?.first as? CAShapeLayer
                let progress = CGFloat(self.timeLeft) / 3600
                let animation = CABasicAnimation(keyPath: "strokeEnd")
                animation.duration = 1
                animation.fromValue = circleLayer?.strokeEnd
                animation.toValue = progress
                animation.timingFunction = CAMediaTimingFunction(name: .linear)
                circleLayer?.strokeEnd = progress
                circleLayer?.add(animation, forKey: "animateStroke")
            } else {
                self.timer?.invalidate()
            }
        }
    }

    
    
    
    func stopTimer() {
        timer?.invalidate()
        timeLeft = 3600
        minutesLeft = 60
        secondsLeft = 0
        timerLabel.text = "60:00"
        
        let circleLayer = progressView.layer.sublayers?.first as? CAShapeLayer
        circleLayer?.removeAllAnimations()
        circleLayer?.strokeEnd = 1
    }



    deinit {
        timer?.invalidate()
        timer = nil
    }
        
    
    
    
}




    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


