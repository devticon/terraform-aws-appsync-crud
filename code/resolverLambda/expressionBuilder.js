const nameRegex = /(?<=")[^"]+(?=":)/g;
const valRegex = /(?<=:")[^"]+(?=")/g;


exports.create = function (arguments) {

  const objString = JSON.stringify(arguments)
  let arrNames = objString.match(nameRegex)
  let arrValues = objString.match(valRegex)

  const index = arrNames.indexOf("id");
  if (index > -1) {
    arrNames.splice(index, 1);
    arrValues.splice(index, 1);
  }

  let updateExp = 'set';
  let expNames = "{";
  let expVal = "{";
  for(let i = 0; i<arrNames.length; i++)
  {
    updateExp += ` #${arrNames[i]} = :${arrNames[i]},`;
    expNames += `"#${arrNames[i]}" : "${arrNames[i]}",`;
    expVal += `":${arrNames[i]}" : "${arrValues[i]}",`;
  }

  updateExp = updateExp.slice(0,updateExp.length-1)
  expNames = expNames.slice(0,expNames.length-1)+"}"
  expVal = expVal.slice(0,expVal.length-1)+"}"

  console.log(updateExp)
  console.log(expNames)
  console.log(expVal)

  return({
    updateExpression:updateExp,
    expressionAttributeNames:JSON.parse(expNames),
    expressionAttributeValues: JSON.parse(expVal)
  })
}