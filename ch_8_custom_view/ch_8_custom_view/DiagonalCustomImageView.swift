import UIKit

@IBDesignable
class DiagonalCustomImageView: UIImageView {
    // 대각선으로 잘린 사각형을 그린다.
    // bezierPath : 그림그리는 것
    
    // path -> layer
    
    // layer -> mask
    // masking : 이미지와 뷰를 겹쳤을 때, 서로 겹치는 부분만 보이도록 한다.
    
    // custom code -> StoryBoard 편집화면에서 바로 볼 수 있도록 하기!
    // @IBDesignable 붙여주면 됨!
    
    @IBInspectable var innerHeight: CGFloat = 0 {
        didSet {
            makeMask()
        }
    }
    
    func makePath() -> UIBezierPath {
        let path = UIBezierPath()
        
        // 왼쪽 위는 x:0, y:0
        // 왼쪽 위가 시작하기 편하다.
        // 시작 포인트 정하기
        // path.move(to: CGPoint.init(x: 0, y: 0))
        path.move(to: CGPoint.zero)
        
        // 오른쪽 끝으로 이동
        path.addLine(to: CGPoint.init(x:self.bounds.width, y: 0))
        
        // 오른쪽 하단으로 이동
        path.addLine(to: CGPoint.init(x:self.bounds.width, y: self.bounds.height))
        
        // 왼쪽 하단으로 이동하는데, 살짝 대각선 모양으로 잘리는 느낌을 주기 위해 하단에서 50올린다.
        path.addLine(to: CGPoint.init(x: 0, y: self.bounds.height - innerHeight))
        
        // 도형의 모든 점을 찍었으면 그리기를 종료한다.
        path.close()
        
        return path
    }
    
    func test() {
        // layer
        // 1. 모든 오브젝트가 가지고 있다.
        // 2. 쉐도우를 준다거나, 외곽선을 그린다거나 한다.
        // 벡터 방식으로 무언가 효과를 줄 수 있는 개념
        
        // mask는 layer 형태이기 때문에 path를 바로 사용할 수 없다.
        // path -> layer
        // layer.mask
    }
    
    func pathToLayer() -> CAShapeLayer {
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = makePath().cgPath
        
        return shapeLayer
    }
    
    func makeMask() {
        self.layer.mask = pathToLayer()
    }
    
    // 그려질 때 실행되도록 한다.
    override func layoutSubviews() {
        makeMask()
    }

}
