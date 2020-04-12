import UIKit

class GraphScrollView: UIView {
    let scrollView = UIScrollView()
    let stackView = UIStackView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func addViews() {
        
        self.backgroundColor = UIColor.red
        
        //Add and setup scroll view
        self.addSubview(self.scrollView)
        self.scrollView.translatesAutoresizingMaskIntoConstraints = false;

        //Constrain scroll view
        self.scrollView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true;
        self.scrollView.topAnchor.constraint(equalTo: self.topAnchor, constant: 20).isActive = true;
        self.scrollView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20).isActive = true;
        self.scrollView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -20).isActive = true;

        //Add and setup stack view
        self.scrollView.addSubview(self.stackView)
        self.stackView.translatesAutoresizingMaskIntoConstraints = false
        self.stackView.axis = .horizontal
        self.stackView.spacing = 10;

        //constrain stack view to scroll view
        self.stackView.leadingAnchor.constraint(equalTo: self.scrollView.leadingAnchor).isActive = true;
        self.stackView.topAnchor.constraint(equalTo: self.scrollView.topAnchor).isActive = true;
        self.stackView.trailingAnchor.constraint(equalTo: self.scrollView.trailingAnchor).isActive = true;
        self.stackView.bottomAnchor.constraint(equalTo: self.scrollView.bottomAnchor).isActive = true;
        
        //constrain width of stack view to width of self.view, NOT scroll view
//        self.stackView.widthAnchor.constraint(equalTo: self.view.widthAnchor).isActive = true;
        
        
        let g = GraphUI(frame: CGRect(x: 0, y: 0, width: 900, height: 900))
        scrollView.contentSize = g.frame.size
       // let g = GraphUI(frame: )
        stackView.addSubview(g)
    }
}

