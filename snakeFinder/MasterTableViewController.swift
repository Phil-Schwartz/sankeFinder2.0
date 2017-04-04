//
//snakeFinder
//

import UIKit

class MasterTableViewController: UITableViewController, UISplitViewControllerDelegate {
    
    var array: NSMutableArray! = NSMutableArray()
    var list = [Snake]()
    var S = Snake(name: "", color:"", endangered:true, pattern:"", description:"", venomous:true)
    let searchController = UISearchController(searchResultsController: nil)
    var filteredSnakes = [Snake]()
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.buildList()
        searchController.searchBar.scopeButtonTitles = ["All", "Bands", "No Pattern", "Blotches", "Stripes", "Spots", "Diamonds" ]
        searchController.searchBar.delegate = self
        
        for sn in list {
           self.array.add(sn.getName())
        }
        
        searchController.searchResultsUpdater = self
        searchController.dimsBackgroundDuringPresentation = false
        searchController.searchBar.text = ""
        definesPresentationContext = true
        tableView.tableHeaderView = searchController.searchBar
        
        self.tableView.reloadData()
        
        self.splitViewController!.delegate = self;
        self.splitViewController!.preferredDisplayMode = UISplitViewControllerDisplayMode.allVisible
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searchController.isActive && searchController.searchBar.text != ""{
            return filteredSnakes.count
        }
        return list.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let snake: Snake
        if searchController.isActive && searchController.searchBar.text != ""
        {
            snake = filteredSnakes[indexPath.row]
        }
            
        else{
            snake = list[indexPath.row]
        }
        
        cell.textLabel?.text = snake.getName()
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "showDetail", sender: self)
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "showDetail" {
            
            let index = self.tableView.indexPathForSelectedRow! as IndexPath
           
            let nav = segue.destination as! UINavigationController
            
            let vc = nav.viewControllers[0] as! DetailViewController
            let cc = nav.viewControllers[0] as! DetailViewController
            let ic = nav.viewControllers[0] as! DetailViewController
            let ec = nav.viewControllers[0] as! DetailViewController
            let imc = nav.viewControllers[0] as! DetailViewController
            
            if searchController.isActive && searchController.searchBar.text != ""{
                vc.titleText = self.filteredSnakes[index.row].getName()
                cc.infoText = self.filteredSnakes[index.row].getDescription()
                ic.colorText = "Color: "+self.filteredSnakes[index.row].getColor()
                ic.endangeredText = self.filteredSnakes[index.row].getEndangered()
                var venom: String = "Not Venemous"
                if self.filteredSnakes[index.row].venomous == true{
                venom = "Venemous"
                }
                ic.venemousText = venom
                
                let choice = UIImage(named: self.filteredSnakes[index.row].getName())
                imc.snakeImage = choice
            }
            
            else{                                      //return the snake selected forLoop
            vc.titleText = self.list[index.row].getName()
            cc.infoText = self.list[index.row].getDescription()
            ic.colorText = "Color: "+self.list[index.row].getColor()
            ec.endangeredText = self.list[index.row].getEndangered()
            let choice = UIImage(named: self.list[index.row].getName())
            imc.snakeImage = choice
            }
            self.tableView.deselectRow(at: index, animated: true)
            
        }
        
    }
    //create the filtered list for display
    func filterContentForSearchText(searchText:String, scope: String = "All"){
        filteredSnakes = list.filter{ snake in
         let categoryMatch = ((scope == "All") || (snake.pattern?.contains(scope.lowercased()))!)
           return categoryMatch && snake.color!.lowercased().contains(searchText.lowercased())
        }
        
        tableView.reloadData()
    }
    
    func buildList(){
        
        
        let S0=Snake(name: "Copperhead", color:"brown", endangered:true, pattern:"bands", description:"Test of the description", venomous:true)
        self.list.append(S0)
        
        let S1=Snake(name: "Cottonmouth", color:"black", endangered:false, pattern:"no pattern", description:"Test of the description", venomous:true)
        self.list.append(S1)
        
        let S2=Snake(name: "Western Diamondback Rattlesnake", color:"brown", endangered:false, pattern:"diamond", description:"Test of the description", venomous:true)
        self.list.append(S2)
        
        let S3=Snake(name: "Timber Rattlesnake", color:"gray, yellow, brown", endangered:false, pattern:"bands", description:"Test of the description", venomous:true)
        self.list.append(S3)
        
        let S4=Snake(name: "Western Pygmy Rattlesnake", color:"brown, blue", endangered:false, pattern:"blotches", description:"Test of the description", venomous:true)
        self.list.append(S4)
        
        let S5=Snake(name: "Texas Coral Snake", color:"red, yellow, black", endangered:false, pattern:"bands", description:"Test of the description", venomous:true)
        self.list.append(S5)
        
        let S6=Snake(name: "Scarlet Snake", color:"red, orange, black", endangered:false, pattern:"imcomplete bands, bands", description:"Test of the description", venomous:false)
        self.list.append(S6)
        
        let S7=Snake(name: "Milk Snake", color:"orange, red, black", endangered:false, pattern:"bands", description:"Test of the description", venomous:false)
        self.list.append(S7)
        
        let S8=Snake(name: "Mississippi Green Watersnake", color:"green, brown", endangered:false, pattern:"no pattern", description:"Test of the description", venomous:false)
        self.list.append(S8)
        
        let S9=Snake(name: "Plain-Bellied Watersnake", color:"gray, black, brown", endangered:false, pattern:"no pattern", description:"Test of the description", venomous:false)
        self.list.append(S9)
        
        let S10=Snake(name: "Broad-Banded Watersnake", color:"brown, black, red", endangered:false, pattern:"bands", description:"20 - 36 inches Large Eyes, verticle lines on mouth it is not endangered or venomous.  It my look like it because of the bright colors or the shape of the head, but it is not venomous.  If it feels harrasssed it will flare its head and body to look more menacing.  Its commonly lives in swamps, small lakes, ponds, streams, or ditches.  It needs a population loaded with any of the followiung: frogs, fish, toads, tadpoles or all of them.", venomous:false)
        self.list.append(S10)
        
        let S11=Snake(name: "Diamondback Watersnake", color:"brown, black", endangered:false, pattern:"bands", description:"The diamond-backed watersnake can be 30-54 inches in length. This snake is harmless, but can be confused for the venomous cottonmouth. You will will usually find this snake in swamps, marshes, creeks, ditches, ponds, small lakes, and bayous.", venomous:false)
        self.list.append(S11)
        
        let S12=Snake(name: "Northern Watersnake", color:"brown, gray", endangered:false, pattern:"blotches", description:"", venomous:false)
        self.list.append(S12)
        
        let S13=Snake(name: "North American Racer", color:"black", endangered:false, pattern:"no pattern", description:"Test of the description", venomous:false)
        self.list.append(S13)

        let S14=Snake(name: "Great Plains Ratsnake", color:"brown, gray", endangered:false, pattern:"blotches", description:"Test of the description", venomous:false)
        self.list.append(S14)

        let S15=Snake(name: "Black Ratsnake", color:"black", endangered:false, pattern:"no pattern", description:"Test of the description", venomous:false)
        self.list.append(S15)

        let S16=Snake(name: "Eastern Hognose Snake", color:"black, yellow", endangered:false, pattern:"blotches", description:"Test of the description", venomous:false)
        self.list.append(S16)

        let S17=Snake(name: "Praire Kingsnake", color:"brown, gray", endangered:false, pattern:"blotches, bands", description:"Test of the description", venomous:true)
        self.list.append(S17)
        
        let S18=Snake(name: "Speckled Kingsnake", color:"brown, gray", endangered:false, pattern:"blotches, bands", description:"Test of the description", venomous:true)
        self.list.append(S18)
        
        let S19=Snake(name: "Coachwhip", color:"brown, gray", endangered:false, pattern:"blotches, bands", description:"Test of the description", venomous:false)
        self.list.append(S19)
        
        let S20=Snake(name: "Rough Green Snake", color:"brown, gray", endangered:false, pattern:"blotches, bands", description:"Test of the description", venomous:false)
        self.list.append(S20)
        
        let S21=Snake(name: "Western Ribbon Snake", color:"brown, gray", endangered:false, pattern:"blotches, bands", description:"Test of the description", venomous:false)
        self.list.append(S21)

        let S22=Snake(name: "Common Garter Snake", color:"brown, gray", endangered:false, pattern:"blotches, bands", description:"Test of the description", venomous:false)
        self.list.append(S22)
       
        let S23=Snake(name: "Western Mud Snake", color:"blue, black, red", endangered:false, pattern:"bands", description:"Test of the description", venomous:false)
        self.list.append(S23)
        
        let S24=Snake(name: "Graham's Crayfish Snake", color:"yellow, brown", endangered:false, pattern:"stripes", description:"Test of the description", venomous:false)
        self.list.append(S24)
        
        let S25=Snake(name: "Glossy Crayfish Snake", color:"brown", endangered:false, pattern:"stripes", description:"Test of the description", venomous:false)
        self.list.append(S25)
        
        let S26=Snake(name: "Queensnake", color:"brown", endangered:false, pattern:"stripes", description:"Test of the description", venomous:false)
        self.list.append(S26)
        
        let S27=Snake(name: "Worm Snake", color:"brown, red", endangered:false, pattern:"stripes", description:"Test of the description", venomous:false)
        self.list.append(S27)
        
        let S28=Snake(name: "Ringneck Snake", color:"brown, blue, black, gray", endangered:false, pattern:"no pattern", description:"Test of the description", venomous:false)
        self.list.append(S28)
        
        let S29=Snake(name: "Ground Snake", color:"brown, red, gray, tan", endangered:false, pattern:"bands, no pattern", description:"Test of the description", venomous:false)
        self.list.append(S29)
        
        let S30=Snake(name: "Brown Snake", color:"brown", endangered:false, pattern:"no pattern", description:"Test of the description", venomous:false)
        self.list.append(S30)
        
        let S31=Snake(name: "Redbelly Snake", color:"gray, brown, yellow, blue, black", endangered:false, pattern:"no pattern", description:"Test of the description", venomous:false)
        self.list.append(S31)
        
        let S32=Snake(name: "Flathead Snake", color:"brown, tan, red", endangered:false, pattern:"no pattern", description:"Test of the description", venomous:false)
        self.list.append(S32)
        
        let S33=Snake(name: "Rough Earthsnake", color:"brown, red, gray", endangered:false, pattern:"no pattern", description:"Test of the description", venomous:false)
        self.list.append(S33)

        let S34=Snake(name: "Smooth Earthsnake", color:"brown, red, gray", endangered:false, pattern:"no pattern", description:"Test of the description", venomous:false)
        self.list.append(S34)

        let S35=Snake(name: "Midland Water Snake", color:"green, black, gray, green", endangered: false, pattern:"spots", description: "Test of description", venomous: false)
        self.list.append(S35)
   
        let S36=Snake(name:"Yellow Bellied Water Snake", color: "brown, black, yellow", endangered:true, pattern: "no pattern", description: "TEST", venomous: false)
        self.list.append(S36)
    
    
    }//end buildList
    
 
    
    // MARK: - UISplitViewControllerDelegate
    
    func splitViewController(_ splitViewController: UISplitViewController, collapseSecondary secondaryViewController: UIViewController, onto primaryViewController: UIViewController) -> Bool {
        
        return true
        
    }

}


    extension MasterTableViewController : UISearchResultsUpdating{
        func updateSearchResults(for searchController: UISearchController) {
            let searchBar = searchController.searchBar
            let scope = searchBar.scopeButtonTitles![searchBar.selectedScopeButtonIndex]
            filterContentForSearchText(searchText: searchController.searchBar.text!, scope: scope)
        }
}
    extension MasterTableViewController: UISearchBarDelegate {
        func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
            filterContentForSearchText(searchText: searchBar.text!, scope: searchBar.scopeButtonTitles![selectedScope])
        }
    
}
