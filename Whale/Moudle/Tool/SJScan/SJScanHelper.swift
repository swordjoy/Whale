//
//  SJScanHelper.swift
//  Whale
//
//  Created by swordjoy on 2017/11/6.
//  Copyright © 2017年 LIU LV YANG. All rights reserved.
//

import Foundation
import AVFoundation
import UIKit

public class SJScanHelper: NSObject {

    static let shared = SJScanHelper()
    
    let session = AVCaptureSession()
    
    public func startScan(with containerView: UIView) {
        // 获取摄像设备
        guard let device = AVCaptureDevice.default(for: .video) else { return }
        // 创建输入流
        guard let input = try? AVCaptureDeviceInput(device: device) else { return }
        // 创建输出流
        let output = AVCaptureMetadataOutput()
        // 设置代理,在主线程刷新
        output.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
        // 设置扫描有效区域
        output.rectOfInterest = self.getScanArea(with: 40)
        // 设置高清
        session.canSetSessionPreset(.high)
        session.addInput(input)
        session.addOutput(output)
        // 设置识别二维码和一些格式条形码
        output.metadataObjectTypes = [AVMetadataObject.ObjectType.qr,
                                      // 条形码
                                      AVMetadataObject.ObjectType.ean13,
                                      AVMetadataObject.ObjectType.code128,
                                      AVMetadataObject.ObjectType.ean8,
                                      AVMetadataObject.ObjectType.upce,
                                      AVMetadataObject.ObjectType.code39,
                                      AVMetadataObject.ObjectType.code93,
                                      AVMetadataObject.ObjectType.code128,
                                      AVMetadataObject.ObjectType.pdf417
        ]
        let layer = AVCaptureVideoPreviewLayer(session: session)
        layer.videoGravity = .resizeAspectFill
        layer.frame = containerView.bounds
        containerView.layer.insertSublayer(layer, at: 0)
        
        session.startRunning()
    }
    
    public func getScanLayer(maskRect: CGRect, scanRech: CGRect) -> CAShapeLayer {
        let cropLayer = CAShapeLayer()
        cropLayer.fillColor = UIColor.black.cgColor
        cropLayer.fillRule = kCAFillRuleEvenOdd
        cropLayer.opacity = 0.3
        
        let path1 = UIBezierPath(roundedRect: scanRech, cornerRadius: 4)
        let path2 = UIBezierPath(rect: maskRect)
        path2.append(path1)
        cropLayer.path = path2.cgPath
        
        return cropLayer
    }
    
    // 这里是按照比例来的
    private func getScanArea(with margin: CGFloat) -> CGRect {
        let sideWidth = UIScreen.width - 2 * margin
        let top = (UIScreen.height - sideWidth) / 2
        
        // 这里默认是横屏
        let scaleWidth = sideWidth / UIScreen.width
        let scaleHeight = sideWidth / UIScreen.height
        let scaleMargin = margin / UIScreen.width
        let scaleTop = top / UIScreen.height
        
        return CGRect(x: scaleTop, y: scaleMargin, width: scaleWidth, height: scaleHeight)
    }
}

extension SJScanHelper: AVCaptureMetadataOutputObjectsDelegate {
    public func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
        if metadataObjects.count == 0 { return }
        guard let code = metadataObjects.first as? AVMetadataMachineReadableCodeObject else { return }
        session.stopRunning()
        print(code.stringValue ?? "No")
    }
}
