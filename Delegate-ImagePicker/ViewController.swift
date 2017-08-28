

import UIKit

class ViewController: UIViewController,UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet var imgView: UIImageView!
 
    @IBAction func pick(_ sender: Any) {
        
        let picker = UIImagePickerController()
        
        picker.sourceType = .photoLibrary
        picker.allowsEditing = true
        
        picker.delegate = self
        
        self.present(picker, animated: false)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        
        self.dismiss(animated: false) { () in //트레일링 클로저 마지막 매개변수 생략 (completion) picker가 완전히 닫힌후 alert창 실행
        
        let alert = UIAlertController(title: "", message: "이미지 선택이 취소되었습니다", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "확인", style: .cancel))
            self.present(alert, animated: false)
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        picker.dismiss(animated: false) { () in
            
            let img = info[UIImagePickerControllerEditedImage] as? UIImage //편집모드, MediaType,OriginalImage,CropRect
            self.imgView.image = img
        }
    }

    @IBAction func cameraPick(_ sender: Any) {
        
        let picker = UIImagePickerController()
        
        picker.sourceType = .camera
        picker.allowsEditing = true
        
        picker.delegate = self
        
        self.present(picker, animated: false)
        
    }
    
    @IBAction func albumPick(_ sender: Any) {
        
        let picker = UIImagePickerController()
        
        picker.sourceType = .savedPhotosAlbum
        picker.allowsEditing = true
        
        picker.delegate = self
        
        self.present(picker, animated: false)
    }

}

