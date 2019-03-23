//
//  ToolHeader.h
//  Category
//
//  Created by Mu on 2019/3/23.
//  Copyright © 2019 Mu. All rights reserved.
//

#ifndef ToolHeader_h
#define ToolHeader_h

#ifdef DEBUG
#define ToolLogFlag YES
#else
#endif

#ifdef ToolLogFlag
#define ToolLog(FORMAT,...) fprintf(stderr,"*********ErrorLog-satrt***********\n{\n文件名称:%s;\n方法:%s;\n行数:%d;\n提示:%s\n}\n**********HGBErrorLog-end***********\n",[[[NSString stringWithUTF8String:__FILE__] lastPathComponent] UTF8String],[[NSString stringWithUTF8String:__func__] UTF8String], __LINE__, [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);
#else
#define URLLog(...);
#endif


#endif /* ToolHeader_h */
