//
//  LearnerListViewModel.swift
//  FindYourBesties
//
//  Created by Muhammad HAFIZH on 10/05/25.
//
//

import SwiftUI
import Combine

class LearnerListViewModel: ObservableObject {
    @Published var searchText = ""
    @Published var appliedGender: String = "All"
    @Published var tempGender: String = "All"
    @Published var appliedSIGs: Set<String> = []
    @Published var tempSIGs: Set<String> = []
    @Published var appliedSigLearning: Set<String> = []
    @Published var tempSigLearning: Set<String> = []
    @Published var appliedHobbies: Set<String> = []
    @Published var tempHobbies: Set<String> = []
    @Published var selectedLearner: Learner? = nil


    private var allLearners: [Learner] = [
    Learner(
                    name: "Muhammad Hafizh",
                    imageName: "Muhammad hafizh",
                    gender: "Male",
                    birthday: "19 February",
                    hometown: "Bandung",
                    address: "Studento L22/19",
                    instagram: "@i.fizh",
                    phone: "+6281224855016",
                    sigs: ["Apple FC (Futsal) S2", "Apple in Melody S1", "Apple TV S1", "AppleFitness+", "Automotive S2"],
                    sigLearning: ["Product", "Competitive programming"],
                    hobbies: ["Baking", "Board games", "Cooking", "Crafting", "Dancing"]
                ),
                Learner(
                    name: "Aisha Putri Nur Hayati",
                    imageName: "Aisha Putri",
                    gender: "Female",
                    birthday: "03 March",
                    hometown: "Jakarta",
                    address: "Jl. Kenangan No. 12",
                    instagram: "@aishaptr",
                    phone: "+6287812345678",
                    sigs: ["Blue Band S2", "board game", "iRead"],
                    sigLearning: ["UX Writing"],
                    hobbies: ["Reading", "Traveling", "Photography"]
                ),
                Learner(
                    name: "Budi Santoso",
                    imageName: "Budi santoso",
                    gender: "Male",
                    birthday: "25 December",
                    hometown: "Surabaya",
                    address: "Griya Asri Blok C/5",
                    instagram: "@budisantoso",
                    phone: "+6285611223344",
                    sigs: ["Chess", "Machine Learning", "Non-Coders to Code"],
                    sigLearning: ["Competitive programming"],
                    hobbies: ["Coding", "Gaming", "Hiking"]
                ),
                Learner(
                    name: "Citra Dewi",
                    imageName: "Citra dewi",
                    gender: "Female",
                    birthday: "10 November",
                    hometown: "Yogyakarta",
                    address: "Jl. Pahlawan No. 56",
                    instagram: "@citradewi",
                    phone: "+6281344556677",
                    sigs: ["Apple in Melody S1", "Magic Hand (Art Club) S1", "Pictahunt S1"],
                    sigLearning: ["Visual Language"],
                    hobbies: ["Painting", "Drawing", "Singing"]
                ),
                Learner(
                    name: "Dharma Putra",
                    imageName: "Dharma putra",
                    gender: "Male",
                    birthday: "01 January",
                    hometown: "Medan",
                    address: "Komplek Bahagia A/1",
                    instagram: "@dharmaputra",
                    phone: "+6282299887766",
                    sigs: ["Golf S1", "iBadminton S1", "IRun S2"],
                    sigLearning: ["Product"],
                    hobbies: ["Sports", "Movies", "Music"]
                ),
                Learner(
                    name: "Eka Sari",
                    imageName: "Eka sari",
                    gender: "Female",
                    birthday: "15 June",
                    hometown: "Semarang",
                    address: "Perum Jaya Blok F/10",
                    instagram: "@ekasari",
                    phone: "+6287755443322",
                    sigs: ["Gorengan S2", "Playhub S1", "Tarot Reading"],
                    sigLearning: ["Game Path"],
                    hobbies: ["Cooking", "Gardening", "Yoga"]
                ),
                Learner(
                    name: "Faisal Akbar",
                    imageName: "Faisal akbar",
                    gender: "Male",
                    birthday: "22 July",
                    hometown: "Palembang",
                    address: "Lorong Damai No. 7",
                    instagram: "@faisalakbar",
                    phone: "+6285766554433",
                    sigs: ["Hunger Games (Archery)", "iPool S2", "TrApple S1"],
                    sigLearning: ["Competitive programming"],
                    hobbies: ["Archery", "Pool", "Technology"]
                ),
                Learner(
                    name: "Gita Lestari",
                    imageName: "Gita lestari",
                    gender: "Female",
                    birthday: "08 April",
                    hometown: "Makassar",
                    address: "Jl. Anggrek No. 21",
                    instagram: "@gitalestari",
                    phone: "+6281988776655",
                    sigs: ["iMand", "Running S1"],
                    sigLearning: ["UX Writing"],
                    hobbies: ["Dancing", "Singing", "Drawing"]
                ),
                Learner(
                    name: "Hendra Wijaya",
                    imageName: "Hendra wijaya",
                    gender: "Male",
                    birthday: "30 September",
                    hometown: "Denpasar",
                    address: "Villa Kembang No. 3",
                    instagram: "@hendrawijaya",
                    phone: "+6282177665544",
                    sigs: ["iVollyBall", "Sepik S2"],
                    sigLearning: ["Visual Language"],
                    hobbies: ["Volleyball", "Surfing", "Reading"]
                ),
                Learner(
                    name: "Indah Permata",
                    imageName: "Indah permata",
                    gender: "Female",
                    birthday: "12 August",
                    hometown: "Padang",
                    address: "Jl. Mawar No. 15",
                    instagram: "@indahpermata",
                    phone: "+6287899887766",
                    sigs: ["Kok Terbang? S2"],
                    sigLearning: ["Product"],
                    hobbies: ["Badminton", "Cooking", "Traveling"]
                ),
                Learner(
                    name: "Joko Susilo",
                    imageName: "Joko susilo",
                    gender: "Male",
                    birthday: "05 May",
                    hometown: "Malang",
                    address: "Perum Damai Blok G/8",
                    instagram: "@jokosusilo",
                    phone: "+6285688776655",
                    sigs: ["Automotive S2", "board game"],
                    sigLearning: ["Game Path"],
                    hobbies: ["Gaming", "Cars", "Music"]
                ),
                Learner(
                    name: "Kartika Sari",
                    imageName: "Kartika sari",
                    gender: "Female",
                    birthday: "28 October",
                    hometown: "Bogor",
                    address: "Jl. Melati No. 9",
                    instagram: "@kartikasari",
                    phone: "+6281299887766",
                    sigs: ["AppleFitness+", "Chess"],
                    sigLearning: ["Competitive programming"],
                    hobbies: ["Reading", "Writing", "Painting"]
                ),
                Learner(
                    name: "Lukman Hakim",
                    imageName: "Lukman hakim",
                    gender: "Male",
                    birthday: "18 November",
                    hometown: "Cirebon",
                    address: "Gang Sejahtera No. 11",
                    instagram: "@lukmanhakim",
                    phone: "+6287788990011",
                    sigs: ["Blue Band S2", "Golf S1"],
                    sigLearning: ["UX Writing"],
                    hobbies: ["Sports", "Movies", "Traveling"]
                ),
                Learner(
                    name: "Maya Anggraini",
                    imageName: "Maya anggraini",
                    gender: "Female",
                    birthday: "07 July",
                    hometown: "Tasikmalaya",
                    address: "Perum Indah Blok H/12",
                    instagram: "@mayaanggraini",
                    phone: "+6285777889900",
                    sigs: ["Gorengan S2", "Hunger Games (Archery)"],
                    sigLearning: ["Visual Language"],
                    hobbies: ["Cooking", "Baking", "Crafting"]
                ),
                Learner(
                    name: "Nugroho Adi",
                    imageName: "Nugroho adi",
                    gender: "Male",
                    birthday: "21 March",
                    hometown: "Solo",
                    address: "Jl. Slamet Riyadi No. 101",
                    instagram: "@nugrohoadi",
                    phone: "+6281333445566",
                    sigs: ["iBadminton S1", "iMand"],
                    sigLearning: ["Product"],
                    hobbies: ["Badminton", "Gaming", "Reading"]
                ),
                Learner(
                    name: "Olivia Putri",
                    imageName: "Olivia putri",
                    gender: "Female",
                    birthday: "14 September",
                    hometown: "Batam",
                    address: "Ruko Sejahtera Blok A No. 5",
                    instagram: "@oliviaputri",
                    phone: "+6282244556677",
                    sigs: ["iPool S2", "iRead"],
                    sigLearning: ["Game Path"],
                    hobbies: ["Swimming", "Reading", "Music"]
                ),
                Learner(
                    name: "Pratama Wijaya",
                    imageName: "Pratama wijaya",
                    gender: "Male",
                    birthday: "29 February",
                    hometown: "Pontianak",
                    address: "Jl. Khatulistiwa No. 22",
                    instagram: "@pratamawijaya",
                    phone: "+6287855667788",
                    sigs: ["IRun S2", "iVollyBall"],
                    sigLearning: ["Competitive programming"],
                    hobbies: ["Running", "Volleyball", "Movies"]
                ),
                Learner(
                    name: "Rina Setiawan",
                    imageName: "Rina setiawan",
                    gender: "Female",
                    birthday: "09 December",
                    hometown: "Samarinda",
                    address: "Perum Harmoni Blok D/15",
                    instagram: "@rinasetiawan",
                    phone: "+6285677889900",
                    sigs: ["Kok Terbang? S2", "Machine Learning"],
                    sigLearning: ["UX Writing"],
                    hobbies: ["Dancing", "Cooking", "Gardening"]
                ),
                Learner(
                    name: "Satria Utama",
                    imageName: "Satria utama",
                    gender: "Male",
                    birthday: "02 June",
                    hometown: "Banjarmasin",
                    address: "Jl. Veteran No. 33",
                    instagram: "@satriautama",
                    phone: "+6281234567890",
                    sigs: ["Magic Hand (Art Club) S1", "Non-Coders to Code"],
                    sigLearning: ["Visual Language"],
                    hobbies: ["Drawing", "Coding", "Gaming"]
                ),
                Learner(
                    name: "Tania Putri",
                    imageName: "Tania putri",
                    gender: "Female",
                    birthday: "26 August",
                    hometown: "Manado",
                    address: "Jl. Boulevard No. 18",
                    instagram: "@taniaputri",
                    phone: "+6282123456789",
                    sigs: ["Pictahunt S1", "Playhub S1"],
                    sigLearning: ["Product"],
                    hobbies: ["Photography", "Board games", "Reading"]
                ),
                Learner(
                    name: "Umar Faruq",
                    imageName: "Umar faruq",
                    gender: "Male",
                    birthday: "11 April",
                    hometown: "Mataram",
                    address: "Griya Lestari Blok E/7",
                    instagram: "@umarfaruq",
                    phone: "+6287712345678",
                    sigs: ["Running S1", "Sepik S2"],
                    sigLearning: ["Game Path"],
                    hobbies: ["Running", "Hiking", "Movies"]
                ),
                Learner(
                    name: "Vera Wijayanti",
                    imageName: "Vera wijayanti",
                    gender: "Female",
                    birthday: "20 July",
                    hometown: "Kupang",
                    address: "Jl. Timor Raya No. 44",
                    instagram: "@verawijayanti",
                    phone: "+6285612345678",
                    sigs: ["Tarot Reading", "TrApple S1"],
                    sigLearning: ["Competitive programming"],
                    hobbies: ["Reading", "Yoga", "Crafting"]
                ),
                Learner(
                    name: "Wildan Hakim",
                    imageName: "Wildan hakim",
                    gender: "Male",
                    birthday: "04 October",
                    hometown: "Sorong",
                    address: "Komplek Indah Blok B/11",
                    instagram: "@wildanhakim",
                    phone: "+6281312345678",
                    sigs: ["Apple FC (Futsal) S2"],
                    sigLearning: ["UX Writing"],
                    hobbies: ["Futsal", "Gaming", "Music"]
                ),
                Learner(
                    name: "Yasmine Putri",
                    imageName: "Yasmine putri",
                    gender: "Female",
                    birthday: "16 May",
                    hometown: "Ambon",
                    address: "Jl. Pattimura No. 27",
                    instagram: "@yasmineputri",
                    phone: "+6282212345678",
                    sigs: ["Apple in Melody S1"],
                    sigLearning: ["Visual Language"],
                    hobbies: ["Singing", "Dancing", "Reading"]
                ),
                Learner(
                    name: "Zainal Abidin",
                    imageName: "Zainal abidin",
                    gender: "Male",
                    birthday: "23 January",
                    hometown: "Ternate",
                    address: "Jl. Merdeka No. 50",
                    instagram: "@zainalabidin",
                    phone: "+6287811223344",
                    sigs: ["Apple TV S1"],
                    sigLearning: ["Product"],
                    hobbies: ["Coding", "Hiking", "Photography"]
                ),
                Learner(
                    name: "Amanda Sari",
                    imageName: "Amanda sari",
                    gender: "Female",
                    birthday: "17 November",
                    hometown: "Tarakan",
                    address: "Perum Jaya Baru Blok C/9",
                    instagram: "@amandasari",
                    phone: "+6285699887766",
                    sigs: ["AppleFitness+"],
                    sigLearning: ["Game Path"],
                    hobbies: ["Yoga", "Cooking", "Gardening"]
                ),
                Learner(
                    name: "Bayu Pratama",
                    imageName: "Bayu pratama",
                    gender: "Male",
                    birthday: "06 August",
                    hometown: "Balikpapan",
                    address: "Jl. Sudirman No. 10",
                    instagram: "@bayupratama",
                    phone: "+6281288776655",
                    sigs: ["Automotive S2"],
                    sigLearning: ["Competitive programming"],
                    hobbies: ["Cars", "Gaming", "Movies"]
                ),
                Learner(
                    name: "Chelsea Dewi",
                    imageName: "Chelsea dewi",
                    gender: "Female",
                    birthday: "24 September",
                    hometown: "Pekanbaru",
                    address: "Komplek Sentosa Blok F/12",
                    instagram: "@chelseadewi",
                    phone: "+6287766554433",
                    sigs: ["Blue Band S2"],
                    sigLearning: ["UX Writing"],
                    hobbies: ["Reading", "Writing", "Music"]
                ),
            Learner(
                name: "David Setyawan",
                imageName: "David Setyawan",
                gender: "Male",
                birthday: "12 December",
                hometown: "Palangkaraya",
                address: "Jl. Ramin No. 23",
                instagram: "@davidsetyawan",
                phone: "+6285212345678",
                sigs: ["board game"],
                sigLearning: ["Visual Language"],
                hobbies: ["Chess", "Coding", "Traveling"]
            ),
            Learner(
                name: "Fiona Azzahra",
                imageName: "Fiona Azzahra",
                gender: "Female",
                birthday: "07 March",
                hometown: "Bengkulu",
                address: "Perum Damai Lestari Blok M/4",
                instagram: "@fionaazzahra",
                phone: "+6281122334455",
                sigs: ["Chess"],
                sigLearning: ["Product"],
                hobbies: ["Reading", "Writing", "Yoga"]
            ),
            Learner(
                name: "Galih Pratama",
                imageName: "Galih Pratama",
                gender: "Male",
                birthday: "19 April",
                hometown: "Kendari",
                address: "Jl. Garuda No. 8",
                instagram: "@galihpratama",
                phone: "+6282344556677",
                sigs: ["Golf S1"],
                sigLearning: ["Game Path"],
                hobbies: ["Golf", "Gaming", "Movies"]
            ),
            Learner(
                name: "Hani Nuraini",
                imageName: "Hani Nuraini",
                gender: "Female",
                birthday: "02 November",
                hometown: "Mamuju",
                address: "Jl. Pantai Indah No. 17",
                instagram: "@haninuraini",
                phone: "+6287877665544",
                sigs: ["Gorengan S2"],
                sigLearning: ["Competitive programming"],
                hobbies: ["Cooking", "Baking", "Traveling"]
            ),
            Learner(
                name: "Imam Syafi",
                imageName: "Imam Syafi",
                gender: "Male",
                birthday: "15 August",
                hometown: "Palu",
                address: "Jl. Soekarno Hatta No. 62",
                instagram: "@imamsyafii",
                phone: "+6281999887766",
                sigs: ["Hunger Games (Archery)"],
                sigLearning: ["UX Writing"],
                hobbies: ["Archery", "Reading", "Sports"]
            ),
            Learner(
                name: "Jessica Tan",
                imageName: "Jessica Tan",
                gender: "Female",
                birthday: "28 May",
                hometown: "Manokwari",
                address: "Perum Ceria Blok K/21",
                instagram: "@jessicatan",
                phone: "+6285788990011",
                sigs: ["iBadminton S1"],
                sigLearning: ["Visual Language"],
                hobbies: ["Badminton", "Music", "Traveling"]
            ),
            Learner(
                name: "Kevin Wijaya",
                imageName: "Kevin Wijaya",
                gender: "Male",
                birthday: "10 January",
                hometown: "Jayapura",
                address: "Jl. Raya Sentani No. 3",
                instagram: "@kevinwijaya",
                phone: "+6281277665544",
                sigs: ["iMand"],
                sigLearning: ["Product"],
                hobbies: ["Gaming", "Coding", "Movies"]
            ),
            Learner(
                name: "Larasati Dewi",
                imageName: "Larasati Dewi",
                gender: "Female",
                birthday: "22 October",
                hometown: "Sorong",
                address: "Jl. Basuki Rahmat No. 91",
                instagram: "@larasatidewi",
                phone: "+6287866554433",
                sigs: ["iPool S2"],
                sigLearning: ["Game Path"],
                hobbies: ["Swimming", "Reading", "Yoga"]
    ),
]



    var filteredLearners: [Learner] {
        allLearners.filter { learner in
            let matchesSearch = searchText.isEmpty ||
                                learner.name.lowercased().contains(searchText.lowercased())

            let matchesGender = appliedGender == "All" ||
                                learner.gender == appliedGender

            let matchesSIGs = appliedSIGs.isEmpty ||
                             !Set(learner.sigs).isDisjoint(with: appliedSIGs)

            let matchesSigLearning = appliedSigLearning.isEmpty ||
                                    !Set(learner.sigLearning).isDisjoint(with: appliedSigLearning)

            let matchesHobbies = appliedHobbies.isEmpty ||
                                !Set(learner.hobbies).isDisjoint(with: appliedHobbies)

            return matchesSearch && matchesGender && matchesSIGs && matchesSigLearning && matchesHobbies
        }
    }


    func selectLearner(_ learner: Learner) {
        selectedLearner = learner
    }


    func clearSelectedLearner() {
        selectedLearner = nil
    }


    func applyFilters() {
        appliedGender = tempGender
        appliedSIGs = tempSIGs
        appliedSigLearning = tempSigLearning
        appliedHobbies = tempHobbies
    }


    func resetFilters() {
        tempGender = "All"
        tempSIGs.removeAll()
        tempSigLearning.removeAll()
        tempHobbies.removeAll()
    }


//    // Call this when applying filters
//    func commitFilters() {
//        appliedGender = tempGender
//        appliedSIGs = tempSIGs
//        appliedSigLearning = tempSigLearning
//        appliedHobbies = tempHobbies
//    }

    // Get all unique SIGs from the database
    func getAllSIGs() -> [String] {
        let allSIGs = Set(allLearners.flatMap { $0.sigs })
        return Array(allSIGs).sorted()
    }

    // Get all unique SIG Learning paths from the database
    func getAllSigLearning() -> [String] {
        let allSigLearning = Set(allLearners.flatMap { $0.sigLearning })
        return Array(allSigLearning).sorted()
    }

    // Get all unique hobbies from the database
    func getAllHobbies() -> [String] {
        let allHobbies = Set(allLearners.flatMap { $0.hobbies })
        return Array(allHobbies).sorted()
    }

    func clearAllFilters() {
        // Reset applied filters
        appliedGender = "All"
        appliedSIGs.removeAll()
        appliedSigLearning.removeAll()
        appliedHobbies.removeAll()

        // Reset temporary filters as well
        tempGender = "All"
        tempSIGs.removeAll()
        tempSigLearning.removeAll()
        tempHobbies.removeAll()

        // Apply the cleared filters
        applyFilters()
    }


    // Add this computed property
    var sortedFilteredLearners: [Learner] {
        return filteredLearners.sorted { $0.name < $1.name }
    }



}
