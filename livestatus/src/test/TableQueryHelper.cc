#include "TableQueryHelper.h"
#include "OutputBuffer.h"
#include "Query.h"
#include "Table.h"
#include "data_encoding.h"

std::string mk::test::query(Table& table, const std::list<std::string>& q) {
    bool flag{false};
    OutputBuffer output{-1, flag, table.logger()};
    Query query{q, table, Encoding::utf8, 5000, output, table.logger()};
    query.process();
    // TODO(ml): Without resetting the flag, the function never terminates
    //           and I do not understand why this is necessary...
    flag = true;
    (void)flag;  // Silence warning.
    return output.str();
}
