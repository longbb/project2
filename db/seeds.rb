Topic.create!(
  name: "C",
  description: "C is a high-level and general purpose programming language that is ideal for developing firmware or portable applications. Originally intended for writing system software, C was developed at Bell Labs by Dennis Ritchie for the Unix Operating System (OS) in the early 1970s."
)
Topic.create!(
  name: "C++",
  description: "C++ is an object oriented programming (OOP) language, developed by Bjarne Stroustrup, and is an extension of C language. It is therefore possible to code C++ in a 'C style' or 'object-oriented style.'' In certain scenarios, it can be coded in either way and is thus an effective example of a hybrid language."
)
Topic.create!(
  name: "Java",
  description: "Java is a programming language expressly designed for use in the distributed environment of the Internet. It was designed to have the 'look and feel' of the C++ language, but it is simpler to use than C++ and enforces an object-oriented programming model."
)
Topic.create!(
  name: "C#",
  description: "C# (pronounced 'C-sharp') is an object-oriented programming language from Microsoft that aims to combine the computing power of C++ with the programming ease of Visual Basic. C# is based on C++ and contains features similar to those of Java."
)
Topic.create!(
  name: "Ruby",
  description: "Ruby is an open source, interpreted , object-oriented programming language created by Yukihiro Matsumoto, who chose the gemstone's name to suggest 'a jewel of a language.' Ruby is designed to be simple, complete, extensible, and portable ."
)
Topic.create!(
  name: "Python",
  description: "Python is an interpreted, object-oriented programming language similar to PERL, that has gained popularity because of its clear syntax and readability. The source code is freely available and open for modification and reuse. Python has a significant number of users."
)
Topic.create!(
  name: "Android",
  description: "Android software development is the process by which new applications are created for the Android operating system. Applications are usually developed in Java programming language using the Android software development kit (SDK), but other development environments are also available."
)
Topic.create!(
  name: "PHP",
  description: "PHP is a server-side scripting language designed for web development but also used as a general-purpose programming language. Originally created by Rasmus Lerdorf in 1994, the PHP reference implementation is now produced by The PHP Group. PHP originally stood for Personal Home Page, but it now stands for the recursive backronym PHP: Hypertext Preprocessor"
)
Topic.create!(
  name: ".NET",
  description: "The .NET Framework is a Microsoft operating system platform that incorporates applications, a suite of tools and services and a change in the infrastructure of the company's Web strategy. The .NET Framework supports building and running of next gen of applications and XML Web services."
)
Topic.create!(
  name: "HTML",
  description: "HTML (Hypertext Markup Language) is the set of markup symbols or codes inserted in a file intended for display on a World Wide Web browser page. The markup tells the Web browser how to display a Web page's words and images for the user."
)
Topic.create!(
  name: "JavaScript",
  description: "JavaScript is an interpreted programming or script language from Netscape. In general, script languages are easier and faster to code in than the more structured and compiled languages such as C and C++. Script languages generally take longer to process than compiled languages, but are very useful for shorter programs."
)
Topic.create!(
  name: "Other",
  description: nil
)
Member.create(
  name: "Admin",
  email: "admin@forum.com",
  password: "admin123",
  status: "active",
  role: "admin"
)
