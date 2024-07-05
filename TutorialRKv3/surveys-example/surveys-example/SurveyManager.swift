//
//  Tasks.swift
//  surveys-example
//
//  Created by Juan David López Regalado on 14/06/24.
//
import Foundation
import ResearchKit

class SurveyManager {
    static let shared = SurveyManager()
    
    func createSurveyTask() -> ORKTask {
        
        // Agradecimiento y explicaciojn
        let thankUJoin = ORKInstructionStep(identifier: "thankUJoin")
        thankUJoin.title = "Thank You!"
        thankUJoin.iconImage = UIImage(systemName: "heart.fill")
        thankUJoin.detailText = "Thanks For Join Us, I Would Appreciate It If You Answered The Next Questions as Honestly as Possible, remember That Your Data is Private, it will not be Shared with Anyone Else and Will Only be Used for the Proposed Study."
        
// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
        // Ficha de identificacion
        
        let personalInfoStepTitle = "Personal Information"
        let personalInfoStep = ORKInstructionStep(identifier: "personalInfoStep")
        personalInfoStep.title = personalInfoStepTitle
        personalInfoStep.text = "Here you will find questions about your personal data"
        personalInfoStep.image = UIImage(systemName: "person.fill")


        // Nombre
        let textQuestionStepTitle = "Name"
        let textAnswerFormat = ORKTextAnswerFormat(maximumLength: 30)
        textAnswerFormat.multipleLines = false
        let textQuestionStep = ORKQuestionStep(identifier: "textName", title: textQuestionStepTitle, question: "What is your name?", answer: textAnswerFormat)
        
        // Sexo
        let multiGenderChoice = "Sex"
        let gendChoices = [
            ORKTextChoice(text: "Male", value: "male" as NSString),
            ORKTextChoice(text: "Female", value: "female" as NSString),
            ORKTextChoice(text: "I prefer not to say", value: "Inf" as NSString)]
        
        let genderChoiceFormat = ORKTextChoiceAnswerFormat(style: .singleChoice, textChoices: gendChoices)
        let multiGenderQuestionStep = ORKQuestionStep(identifier: "multiGenderQuestionStep", title: multiGenderChoice,question: "What is your Sex?", answer: genderChoiceFormat)
        
        // Fecha de nacimiento
        let dobStepTitle = "Date of Birth"
        let dobAnswerFormat = ORKDateAnswerFormat(style: .date)
        let dobStep = ORKQuestionStep(identifier: "dobStep", title: dobStepTitle, question: "When were you born?", answer: dobAnswerFormat)
        
        
        // Peso
        let weighQuestion = ORKFormItem(sectionTitle: "What is your weight?")

        let weightQuestionFormItem = ORKFormItem(identifier: "weightQuestionForm", text: nil, answerFormat: ORKAnswerFormat.weightAnswerFormat())
        weightQuestionFormItem.placeholder = "Tap here"
        
        let weighForm = ORKFormStep(identifier: "WeightQuestionIde", title: "Weigh", text: " ")
        weighForm.formItems = [weighQuestion, weightQuestionFormItem]
        
        // Estatura
        let heightQuestion = ORKFormItem(sectionTitle: "What is your height?")

        let heightQuestionFormItem = ORKFormItem(identifier: "weightQuestionForm", text: nil, answerFormat: ORKAnswerFormat.heightAnswerFormat())
        heightQuestionFormItem.placeholder = "Tap here"
        
        let heightForm = ORKFormStep(identifier: "HeightQuestionIde", title: "Height", text: " ")
        heightForm.formItems = [heightQuestion, heightQuestionFormItem]
        
        // Residencia
        let residenceChoice = "Reside"
        let residenceChoices = [
            ORKTextChoice(text: "Urban", value: "urban" as NSString),
            ORKTextChoice(text: "Sub-urban", value: "suburban" as NSString),
            ORKTextChoice(text: "Rural", value: "Rural" as NSString)]
        
        let residenceChoiceFormat = ORKTextChoiceAnswerFormat(style: .singleChoice, textChoices: residenceChoices)
        let residenceQuestionStep = ORKQuestionStep(identifier: "residenceStep", title: residenceChoice,question: "Where do you Reside?", answer: residenceChoiceFormat)
    
        
        // Pregunta de ocupación
       let occupationQuestionTitle = "Occupation"
       let occupationChoices = [
           ORKTextChoice(text: "Student", value: "student" as NSString),
           ORKTextChoice(text: "Employed", value: "employed" as NSString),
           ORKTextChoice(text: "Self-Employed", value: "self_employed" as NSString),
           ORKTextChoice(text: "Unemployed", value: "unemployed" as NSString),
           ORKTextChoice(text: "Retired", value: "retired" as NSString),
           ORKTextChoice(text: "Homemaker", value: "homemaker" as NSString),
           ORKTextChoice(text: "Other", value: "other" as NSString)
       ]
       
       let occupationChoiceFormat = ORKValuePickerAnswerFormat(textChoices: occupationChoices)
       let occupationQuestionStep = ORKQuestionStep(identifier: "occupationQuestionStep", title: occupationQuestionTitle, question: "What is your occupation?", answer: occupationChoiceFormat)
       
       // Pregunta adicional para especificar detalles de ocupación
        _ = "Please specify your occupation:"
       let specifyOccupationAnswerFormat = ORKTextAnswerFormat(maximumLength: 100)
       specifyOccupationAnswerFormat.multipleLines = true // Permitir múltiples líneas para detalles extensos
       
       // Añadir la pregunta adicional después de la pregunta de ocupación
       let occupationFormStep = ORKFormStep(identifier: "OccupationFormStep", title: "Occupation", text: "Select your occupation and specify details if necessary.")
       occupationFormStep.formItems = [
           ORKFormItem(identifier: "OccupationFormItem", text: nil, answerFormat: occupationChoiceFormat),
           ORKFormItem(identifier: "SpecifyOccupationDetailsFormItem", text: nil, answerFormat: specifyOccupationAnswerFormat)
       ]
       
        
//=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=--=-=-

        // Heredo Familiares
        
        let hereditaryInfoStepTitle = "Hereditary Family History"
        let hereditaryInfoStep = ORKInstructionStep(identifier: "hereditaryInfoStep")
        hereditaryInfoStep.title = hereditaryInfoStepTitle
        hereditaryInfoStep.text = "Here you will find questions about your family, and their diseases"
        hereditaryInfoStep.image = UIImage(systemName: "person.3.fill")
        
        // Patologías hereditarias
        let patologyChoice = "Pathologies"
        let patologyChoices = [
            ORKTextChoice(text: "Diabetes", value: "diabetes" as NSString),
            ORKTextChoice(text: "Heart Disease", value: "heartDisease" as NSString),
            ORKTextChoice(text: "Hypertension", value: "hypertension" as NSString),
            ORKTextChoice(text: "Cancer", value: "cancer" as NSString),
            ORKTextChoice(text: "Asthma", value: "asthma" as NSString)]
        
        let patologyChoiceFormat = ORKTextChoiceAnswerFormat(style: .multipleChoice, textChoices: patologyChoices)
        let patologyQuestionStep = ORKQuestionStep(identifier: "patologyStep", title: patologyChoice, question: "Select only the pathologies that your close relatives such as father, mother, grandfather or grandmother have or had.", answer: patologyChoiceFormat)
    
        
        // Patologías mentales hereditarias
        let mentalPatologyChoice = "Mental Pathologies"
        let mentalPatologyChoices = [
            ORKTextChoice(text: "Bipolarity", value: "bipolarity" as NSString),
            ORKTextChoice(text: "Autism", value: "autism" as NSString),
            ORKTextChoice(text: "Depression", value: "depression" as NSString),
            ORKTextChoice(text: "ADHD", value: "adhd" as NSString),
            ORKTextChoice(text: "Anxiety", value: "anxiety" as NSString)]
        
        let mentalPatologyChoiceFormat = ORKTextChoiceAnswerFormat(style: .multipleChoice, textChoices: mentalPatologyChoices)
        let mentalPatologyQuestionStep = ORKQuestionStep(identifier: "mentalPatologyStep", title: mentalPatologyChoice, question: "Select only the mental pathologies that your close relatives such as father, mother, grandfather or grandmother have or had.", answer: mentalPatologyChoiceFormat)
        
       
//=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
      
        // Antecedentes personales patológicos
        
        let persInfoStepTitle = "Pathological personal history"
        let persInfoStep = ORKInstructionStep(identifier: "persInfoStep")
        persInfoStep.title = persInfoStepTitle
        persInfoStep.text = "In this part you will find questions about the diseases you suffered or suffer from."
        persInfoStep.image = UIImage(systemName: "person.crop.circle")
        
        // Enfermedades propias
        let diseasesChoice = "Diseases"
        let diseasesChoices = [
            ORKTextChoice(text: "Diabetes", value: "diabetes" as NSString),
            ORKTextChoice(text: "Heart Disease", value: "heartDisease" as NSString),
            ORKTextChoice(text: "Hypertension", value: "hypertension" as NSString),
            ORKTextChoice(text: "Cancer", value: "cancer" as NSString),
            ORKTextChoice(text: "Asthma", value: "asthma" as NSString),
            ORKTextChoice(text: "Hepatitis", value: "hepatitis" as NSString),
            ORKTextChoice(text: "Covid", value: "covid" as NSString),
            ORKTextChoice(text: "Tuberculosis", value: "tuberculosis" as NSString),
            ORKTextChoice(text: "AIDS", value: "aids" as NSString),
            ORKTextChoice(text: "Bipolarity", value: "bipolarity" as NSString),
            ORKTextChoice(text: "Autism", value: "autism" as NSString),
            ORKTextChoice(text: "Depression", value: "depression" as NSString),
            ORKTextChoice(text: "ADHD", value: "adhd" as NSString),
            ORKTextChoice(text: "Anxiety", value: "anxiety" as NSString)]
        
        let diseasesChoiceFormat = ORKTextChoiceAnswerFormat(style: .multipleChoice, textChoices: diseasesChoices)
        let diseasesQuestionStep = ORKQuestionStep(identifier: "diseasesStep", title: diseasesChoice, question: "Select the diseases you have had or suffer from.", answer: diseasesChoiceFormat)
        
        
        // Vacunacion
        let vaccinationQuestionTitle = "Vaccination"
        let vaccinationChoices = [
            ORKTextChoice(text: "Yes", value: "never" as NSString),
            ORKTextChoice(text: "No", value: "little" as NSString),
            ORKTextChoice(text: "I don't remember ", value: "moderate" as NSString),]
        
        let vaccinationChoiceFormat = ORKValuePickerAnswerFormat(textChoices: vaccinationChoices)
        let vaccinationQuestionStep = ORKQuestionStep(identifier: "vaccinationQuestionStep", title: vaccinationQuestionTitle, question: "Do you have your complete vaccination schedule?", answer: vaccinationChoiceFormat)
        
        // Bebedor alcohol
       let alcoholQuestionTitle = "Alcohol drinker"
       let alcoholChoices = [
           ORKTextChoice(text: "No Drinks Alcohol", value: "nodrink" as NSString),
           ORKTextChoice(text: "Social Drinker", value: "social" as NSString),
           ORKTextChoice(text: "Occasional Drinker ", value: "occasional" as NSString),
           ORKTextChoice(text: "Dependent Drinker", value: "dependent" as NSString),]
       
       let alcoholChoiceFormat = ORKValuePickerAnswerFormat(textChoices: alcoholChoices)
       let alcoholQuestionStep = ORKQuestionStep(identifier: "alcoholQuestionStep", title: alcoholQuestionTitle, question: "What kind of drinker are you?", answer: alcoholChoiceFormat)
        
        // fumador tabaco
       let smokeQuestionTitle = "Tobacco Smoker"
       let smokeChoices = [
           ORKTextChoice(text: "No Smoker", value: "nosmoke" as NSString),
           ORKTextChoice(text: "Social Smoker", value: "socialsmoke" as NSString),
           ORKTextChoice(text: "Occasional Smoker ", value: "occasionalsmoke" as NSString),
           ORKTextChoice(text: "Dependent Smoker", value: "dependentsmoke" as NSString),]
       
       let smokeChoiceFormat = ORKValuePickerAnswerFormat(textChoices: smokeChoices)
       let smokeQuestionStep = ORKQuestionStep(identifier: "smokeQuestionStep", title: smokeQuestionTitle, question: "What kind of smoker are you?", answer: smokeChoiceFormat)
        
        // drogas
        let drugsPatologyChoice = "Drugs"
        let drugsPatologyChoices = [
            ORKTextChoice(text: "I do not consume drugs", value: "nodrugs" as NSString),
            ORKTextChoice(text: "Marihuana", value: "marihuana" as NSString),
            ORKTextChoice(text: "Cocaine", value: "cocaine" as NSString),
            ORKTextChoice(text: "MDMA (Ectasty)", value: "mdma" as NSString),
            ORKTextChoice(text: "Heroine", value: "heroine" as NSString),
            ORKTextChoice(text: "Methamphetamine", value: "metha" as NSString),
            ORKTextChoice(text: "LSD", value: "lsd" as NSString),
            ORKTextChoice(text: "Hallucinogenic Mushrooms", value: "mushrooms" as NSString),
            ORKTextChoice(text: "Other", value: "other" as NSString),]
        
        let drugsPatologyChoiceFormat = ORKTextChoiceAnswerFormat(style: .multipleChoice, textChoices: drugsPatologyChoices)
        let drugsPatologyQuestionStep = ORKQuestionStep(identifier: "drugsPatologyStep", title: drugsPatologyChoice, question: "Select the drug or drugs you consume", answer: drugsPatologyChoiceFormat)
        
        let frecuencyDrugsQuestionTitle = "Frequency of Drug Use"
        let frecuencyDrugsChoices = [
            ORKTextChoice(text: "Never", value: "never" as NSString),
            ORKTextChoice(text: "A little", value: "little" as NSString),
            ORKTextChoice(text: "Moderate", value: "moderate" as NSString),
            ORKTextChoice(text: "A lot", value: "lot" as NSString),]
        
        let frecuencyDrugsChoiceFormat = ORKValuePickerAnswerFormat(textChoices: frecuencyDrugsChoices)
        let frecuencyDrugsQuestionStep = ORKQuestionStep(identifier: "frecuencyDrugsQuestionStep", title: frecuencyDrugsQuestionTitle, question: "How often do you use drugs?", answer: frecuencyDrugsChoiceFormat)
        
        
//=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
    
        // Antecedentes no patológicos
        
        let noPersInfoStepTitle = "Non-pathological history"
        let noPersInfoStep = ORKInstructionStep(identifier: "moPersInfoStep")
        noPersInfoStep.title = noPersInfoStepTitle
        noPersInfoStep.text = "In this section, you'll find questions about your non-pathological backgrounds, such as your daily activities and personal habits."
        noPersInfoStep.image = UIImage(systemName: "book.fill")
        
        
        // pregunta de actividad física en escala de likert
        let scaleQuestionStepTitle = "Physical activity"
        let scaleAnswerFormat = ORKScaleAnswerFormat(maximumValue: 10, minimumValue: 0, defaultValue: 5, step: 1)
        let scaleQuestionStep = ORKQuestionStep(identifier: "scaleQuestionStep", title: scaleQuestionStepTitle,question: "How active are you?", answer: scaleAnswerFormat)
        
        
        // Tipo de actividad fisica que realizas.
        let multiChoiceQuestionStepTitle = "What types of physical activities do you do?"
        let textChoices = [
            ORKTextChoice(text: "Walking", value: "walking" as NSString),
            ORKTextChoice(text: "Running", value: "running" as NSString),
            ORKTextChoice(text: "Swimming", value: "swimming" as NSString),
            ORKTextChoice(text: "Cycling", value: "cycling" as NSString),
            ORKTextChoice(text: "Soccer", value: "soccer" as NSString),
            ORKTextChoice(text: "Basketball", value: "basketball" as NSString),
            ORKTextChoice(text: "Tennis", value: "tennis" as NSString),
            ORKTextChoice(text: "Baseball", value: "baseball" as NSString),
            ORKTextChoice(text: "Golf", value: "golf" as NSString),
            ORKTextChoice(text: "Athletics", value: "athletic" as NSString),
            ORKTextChoice(text: "Football", value: "football" as NSString),
            ORKTextChoice(text: "Martial Arts", value: "martialarts" as NSString),
            ORKTextChoice(text: "Other", value: "other" as NSString),

        ]
        let multiChoiceAnswerFormat = ORKTextChoiceAnswerFormat(style: .multipleChoice, textChoices: textChoices)
        let multiChoiceQuestionStep = ORKQuestionStep(identifier: "multiChoiceQuestionStep", title: multiChoiceQuestionStepTitle, question: "Select the activities you do regularly", answer: multiChoiceAnswerFormat)
        
        // hobbies
        let hobbieQuestionStepTitle = "What types of physical activities do you do?"
        let hobbietextChoices = [
            ORKTextChoice(text: "Reading", value: "reading" as NSString),
            ORKTextChoice(text: "Watching movies and series", value: "watchingmovies" as NSString),
            ORKTextChoice(text: "Video Gaming", value: "gaming" as NSString),
            ORKTextChoice(text: "Cooking and baking", value: "cooking" as NSString),
            ORKTextChoice(text: "Traveling", value: "traveling" as NSString),
            ORKTextChoice(text: "Gardening", value: "gardening" as NSString),
            ORKTextChoice(text: "Arts", value: "arts" as NSString),
            ORKTextChoice(text: "Music", value: "music" as NSString),
            ORKTextChoice(text: "Photography", value: "photography" as NSString),
            ORKTextChoice(text: "Writing", value: "writing" as NSString),
            ORKTextChoice(text: "Dancing", value: "dancing" as NSString),
            ORKTextChoice(text: "Other", value: "other" as NSString),

        ]
        let hobbieAnswerFormat = ORKTextChoiceAnswerFormat(style: .multipleChoice, textChoices: hobbietextChoices)
        let hobbieQuestionStep = ORKQuestionStep(identifier: "hobbieQuestionStep", title: hobbieQuestionStepTitle, question: "Select the activities you do regularly", answer: hobbieAnswerFormat)
        
        // level of study
        let studyQuestionTitle = "Level of study"
        let studyChoices = [
            ORKTextChoice(text: "Elementary School", value: "elementary" as NSString),
            ORKTextChoice(text: "Middle School", value: "middle" as NSString),
            ORKTextChoice(text: "High School", value: "high" as NSString),
            ORKTextChoice(text: "Bachelor's Degree", value: "bachelor" as NSString),
            ORKTextChoice(text: "Master's Degree", value: "master" as NSString),
            ORKTextChoice(text: "Doctorate", value: "doctorate" as NSString),
            ORKTextChoice(text: "Other", value: "other" as NSString),
        ]
        
        let studyChoiceFormat = ORKValuePickerAnswerFormat(textChoices: studyChoices)
        let studyQuestionStep = ORKQuestionStep(identifier: "studyQuestionStep", title: studyQuestionTitle, question: "What is your level of study?", answer: studyChoiceFormat)
        
        // transporte
        let transportationQuestionTitle = "Transportation"
        let transportationChoices = [
            ORKTextChoice(text: "Telecommuting (remote work)", value: "telecommuting" as NSString),
            ORKTextChoice(text: "Car", value: "car" as NSString),
            ORKTextChoice(text: "Public Transport (bus, subway, tram, train)", value: "publictransport" as NSString),
            ORKTextChoice(text: "Bicycle", value: "bicycle" as NSString),
            ORKTextChoice(text: "Motorcycle", value: "motorcycle" as NSString),
            ORKTextChoice(text: "Walking", value: "walking" as NSString),
            ORKTextChoice(text: "Electric Scooter", value: "electricscooter" as NSString),
            ORKTextChoice(text: "Skateboard", value: "skateboard" as NSString),
            ORKTextChoice(text: "Other", value: "other" as NSString),
        ]
        
        let transportationChoiceFormat = ORKValuePickerAnswerFormat(textChoices: transportationChoices)
        let transportationQuestionStep = ORKQuestionStep(identifier: "transportationQuestionStep", title: transportationQuestionTitle, question: "What is the means of transportation you use from home to work or school?", answer: transportationChoiceFormat)
        
        //Alimentación
        
        let foodQuestionTitle = "Alimentation"
        let foodChoices = [
            ORKTextChoice(text: "Good", value: "good" as NSString),
            ORKTextChoice(text: "Average", value: "average" as NSString),
            ORKTextChoice(text: "Poor", value: "poor" as NSString),]
        
        let foodChoiceFormat = ORKValuePickerAnswerFormat(textChoices: foodChoices)
        let foodQuestionStep = ORKQuestionStep(identifier: "foodQuestionStep", title: foodQuestionTitle, question: "How would you describe your quality and quantity of food?", answer: foodChoiceFormat)
        
        // cuantas veces comes
        let alimentationQuestionStepTitle = "Alimentation"
        let alimentationAnswerFormat = ORKScaleAnswerFormat(maximumValue: 10, minimumValue: 0, defaultValue: 3, step: 1)
        let alimentationQuestionStep = ORKQuestionStep(identifier: "alimentationQuestionStep", title: alimentationQuestionStepTitle,question: "How many meals do you have a day?", answer: alimentationAnswerFormat)
        
        // tipo de alimento
        let typeFoodChoice = "Types of food"
        let typeFoodChoices = [
            ORKTextChoice(text: "Chicken", value: "chicken" as NSString),
                ORKTextChoice(text: "Beef", value: "beef" as NSString),
                ORKTextChoice(text: "Pork", value: "pork" as NSString),
                ORKTextChoice(text: "Seafood", value: "seafood" as NSString),
                ORKTextChoice(text: "Fruits/Vegetables", value: "fruitsvegetables" as NSString),
                ORKTextChoice(text: "Other", value: "other" as NSString)
            ]
        
        let typeFoodChoiceFormat = ORKTextChoiceAnswerFormat(style: .multipleChoice, textChoices: typeFoodChoices)
        let typeFoodQuestionStep = ORKQuestionStep(identifier: "typeFoodStep", title: typeFoodChoice, question: "SWhat type of food do you eat?", answer: typeFoodChoiceFormat)
        
        
//=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

        // Mostrar las preguntas
        
        return ORKOrderedTask(identifier: "SurveyTask", steps: [thankUJoin, personalInfoStep, textQuestionStep, multiGenderQuestionStep, dobStep, weighForm, heightForm, residenceQuestionStep, occupationQuestionStep, occupationFormStep, hereditaryInfoStep, patologyQuestionStep, mentalPatologyQuestionStep, persInfoStep, diseasesQuestionStep, vaccinationQuestionStep, alcoholQuestionStep, smokeQuestionStep, drugsPatologyQuestionStep, frecuencyDrugsQuestionStep,noPersInfoStep, scaleQuestionStep, multiChoiceQuestionStep, hobbieQuestionStep, studyQuestionStep, transportationQuestionStep, foodQuestionStep, alimentationQuestionStep, typeFoodQuestionStep])
    }
    
    
}
