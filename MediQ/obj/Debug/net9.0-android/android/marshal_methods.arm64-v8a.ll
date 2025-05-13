; ModuleID = 'marshal_methods.arm64-v8a.ll'
source_filename = "marshal_methods.arm64-v8a.ll"
target datalayout = "e-m:e-i8:8:32-i16:16:32-i64:64-i128:128-n32:64-S128"
target triple = "aarch64-unknown-linux-android21"

%struct.MarshalMethodName = type {
	i64, ; uint64_t id
	ptr ; char* name
}

%struct.MarshalMethodsManagedClass = type {
	i32, ; uint32_t token
	ptr ; MonoClass klass
}

@assembly_image_cache = dso_local local_unnamed_addr global [352 x ptr] zeroinitializer, align 8

; Each entry maps hash of an assembly name to an index into the `assembly_image_cache` array
@assembly_image_cache_hashes = dso_local local_unnamed_addr constant [1056 x i64] [
	i64 u0x001e58127c546039, ; 0: lib_System.Globalization.dll.so => 42
	i64 u0x0024d0f62dee05bd, ; 1: Xamarin.KotlinX.Coroutines.Core.dll => 300
	i64 u0x006b9d7c1c7e1c42, ; 2: de/Microsoft.Data.SqlClient.resources => 305
	i64 u0x0071cf2d27b7d61e, ; 3: lib_Xamarin.AndroidX.SwipeRefreshLayout.dll.so => 279
	i64 u0x01109b0e4d99e61f, ; 4: System.ComponentModel.Annotations.dll => 13
	i64 u0x02123411c4e01926, ; 5: lib_Xamarin.AndroidX.Navigation.Runtime.dll.so => 268
	i64 u0x02827b47e97f2378, ; 6: System.Security.Cryptography.Pkcs.dll => 211
	i64 u0x0284512fad379f7e, ; 7: System.Runtime.Handles => 105
	i64 u0x029b2c18aaa0996c, ; 8: lib-ko-Microsoft.Data.SqlClient.resources.dll.so => 310
	i64 u0x02a4c5a44384f885, ; 9: Microsoft.Extensions.Caching.Memory => 181
	i64 u0x02abedc11addc1ed, ; 10: lib_Mono.Android.Runtime.dll.so => 171
	i64 u0x02f55bf70672f5c8, ; 11: lib_System.IO.FileSystem.DriveInfo.dll.so => 48
	i64 u0x032267b2a94db371, ; 12: lib_Xamarin.AndroidX.AppCompat.dll.so => 222
	i64 u0x03621c804933a890, ; 13: System.Buffers => 7
	i64 u0x0399610510a38a38, ; 14: lib_System.Private.DataContractSerialization.dll.so => 86
	i64 u0x043032f1d071fae0, ; 15: ru/Microsoft.Maui.Controls.resources => 341
	i64 u0x044440a55165631e, ; 16: lib-cs-Microsoft.Maui.Controls.resources.dll.so => 319
	i64 u0x046eb1581a80c6b0, ; 17: vi/Microsoft.Maui.Controls.resources => 347
	i64 u0x0470607fd33c32db, ; 18: Microsoft.IdentityModel.Abstractions.dll => 193
	i64 u0x047408741db2431a, ; 19: Xamarin.AndroidX.DynamicAnimation => 242
	i64 u0x0514f1a3ae77a228, ; 20: lib_Xamarin.Kotlin.StdLib.Common.dll.so => 296
	i64 u0x0517ef04e06e9f76, ; 21: System.Net.Primitives => 71
	i64 u0x0565d18c6da3de38, ; 22: Xamarin.AndroidX.RecyclerView => 272
	i64 u0x0581db89237110e9, ; 23: lib_System.Collections.dll.so => 12
	i64 u0x05989cb940b225a9, ; 24: Microsoft.Maui.dll => 201
	i64 u0x05a1c25e78e22d87, ; 25: lib_System.Runtime.CompilerServices.Unsafe.dll.so => 102
	i64 u0x05d8ca8ee551619f, ; 26: zh-Hant/Microsoft.Data.SqlClient.resources => 316
	i64 u0x06073ed944b92dc4, ; 27: lib-tr-Microsoft.Data.SqlClient.resources.dll.so => 314
	i64 u0x06076b5d2b581f08, ; 28: zh-HK/Microsoft.Maui.Controls.resources => 348
	i64 u0x06388ffe9f6c161a, ; 29: System.Xml.Linq.dll => 156
	i64 u0x06600c4c124cb358, ; 30: System.Configuration.dll => 19
	i64 u0x067f95c5ddab55b3, ; 31: lib_Xamarin.AndroidX.Fragment.Ktx.dll.so => 247
	i64 u0x0680a433c781bb3d, ; 32: Xamarin.AndroidX.Collection.Jvm => 229
	i64 u0x069fff96ec92a91d, ; 33: System.Xml.XPath.dll => 161
	i64 u0x070b0847e18dab68, ; 34: Xamarin.AndroidX.Emoji2.ViewsHelper.dll => 244
	i64 u0x0739448d84d3b016, ; 35: lib_Xamarin.AndroidX.VectorDrawable.dll.so => 282
	i64 u0x07469f2eecce9e85, ; 36: mscorlib.dll => 167
	i64 u0x07c57877c7ba78ad, ; 37: ru/Microsoft.Maui.Controls.resources.dll => 341
	i64 u0x07dcdc7460a0c5e4, ; 38: System.Collections.NonGeneric => 10
	i64 u0x08015600dcbf6dc7, ; 39: it/Microsoft.Data.SqlClient.resources.dll => 308
	i64 u0x08122e52765333c8, ; 40: lib_Microsoft.Extensions.Logging.Debug.dll.so => 188
	i64 u0x088610fc2509f69e, ; 41: lib_Xamarin.AndroidX.VectorDrawable.Animated.dll.so => 283
	i64 u0x08881a0a9768df86, ; 42: lib_Azure.Core.dll.so => 174
	i64 u0x08a7c865576bbde7, ; 43: System.Reflection.Primitives => 96
	i64 u0x08c9d051a4a817e5, ; 44: Xamarin.AndroidX.CustomView.PoolingContainer.dll => 239
	i64 u0x08f3c9788ee2153c, ; 45: Xamarin.AndroidX.DrawerLayout => 241
	i64 u0x09138715c92dba90, ; 46: lib_System.ComponentModel.Annotations.dll.so => 13
	i64 u0x0919c28b89381a0b, ; 47: lib_Microsoft.Extensions.Options.dll.so => 189
	i64 u0x092266563089ae3e, ; 48: lib_System.Collections.NonGeneric.dll.so => 10
	i64 u0x095cacaf6b6a32e4, ; 49: System.Memory.Data => 210
	i64 u0x09d144a7e214d457, ; 50: System.Security.Cryptography => 127
	i64 u0x09e2b9f743db21a8, ; 51: lib_System.Reflection.Metadata.dll.so => 95
	i64 u0x0a805f95d98f597b, ; 52: lib_Microsoft.Extensions.Caching.Abstractions.dll.so => 180
	i64 u0x0abb3e2b271edc45, ; 53: System.Threading.Channels.dll => 140
	i64 u0x0adeb6c0f5699d33, ; 54: Microsoft.Data.SqlClient.dll => 179
	i64 u0x0b06b1feab070143, ; 55: System.Formats.Tar => 39
	i64 u0x0b3b632c3bbee20c, ; 56: sk/Microsoft.Maui.Controls.resources => 342
	i64 u0x0b6aff547b84fbe9, ; 57: Xamarin.KotlinX.Serialization.Core.Jvm => 303
	i64 u0x0be2e1f8ce4064ed, ; 58: Xamarin.AndroidX.ViewPager => 285
	i64 u0x0c3ca6cc978e2aae, ; 59: pt-BR/Microsoft.Maui.Controls.resources => 338
	i64 u0x0c59ad9fbbd43abe, ; 60: Mono.Android => 172
	i64 u0x0c65741e86371ee3, ; 61: lib_Xamarin.Android.Glide.GifDecoder.dll.so => 216
	i64 u0x0c74af560004e816, ; 62: Microsoft.Win32.Registry.dll => 5
	i64 u0x0c7790f60165fc06, ; 63: lib_Microsoft.Maui.Essentials.dll.so => 202
	i64 u0x0c83c82812e96127, ; 64: lib_System.Net.Mail.dll.so => 67
	i64 u0x0cce4bce83380b7f, ; 65: Xamarin.AndroidX.Security.SecurityCrypto => 276
	i64 u0x0d13cd7cce4284e4, ; 66: System.Security.SecureString => 130
	i64 u0x0d3b5ab8b2766190, ; 67: lib_Microsoft.Bcl.AsyncInterfaces.dll.so => 177
	i64 u0x0d63f4f73521c24f, ; 68: lib_Xamarin.AndroidX.SavedState.SavedState.Ktx.dll.so => 275
	i64 u0x0e04e702012f8463, ; 69: Xamarin.AndroidX.Emoji2 => 243
	i64 u0x0e14e73a54dda68e, ; 70: lib_System.Net.NameResolution.dll.so => 68
	i64 u0x0f37dd7a62ae99af, ; 71: lib_Xamarin.AndroidX.Collection.Ktx.dll.so => 230
	i64 u0x0f5e7abaa7cf470a, ; 72: System.Net.HttpListener => 66
	i64 u0x0fbe06392ef90569, ; 73: lib-ja-Microsoft.Data.SqlClient.resources.dll.so => 309
	i64 u0x1001f97bbe242e64, ; 74: System.IO.UnmanagedMemoryStream => 57
	i64 u0x102861e4055f511a, ; 75: Microsoft.Bcl.AsyncInterfaces.dll => 177
	i64 u0x102a31b45304b1da, ; 76: Xamarin.AndroidX.CustomView => 238
	i64 u0x1065c4cb554c3d75, ; 77: System.IO.IsolatedStorage.dll => 52
	i64 u0x108cf0e0ba098a51, ; 78: es/Microsoft.Data.SqlClient.resources => 306
	i64 u0x10f6cfcbcf801616, ; 79: System.IO.Compression.Brotli => 43
	i64 u0x114443cdcf2091f1, ; 80: System.Security.Cryptography.Primitives => 125
	i64 u0x11a603952763e1d4, ; 81: System.Net.Mail => 67
	i64 u0x11a70d0e1009fb11, ; 82: System.Net.WebSockets.dll => 81
	i64 u0x11f26371eee0d3c1, ; 83: lib_Xamarin.AndroidX.Lifecycle.Runtime.Ktx.dll.so => 258
	i64 u0x12128b3f59302d47, ; 84: lib_System.Xml.Serialization.dll.so => 158
	i64 u0x123639456fb056da, ; 85: System.Reflection.Emit.Lightweight.dll => 92
	i64 u0x12521e9764603eaa, ; 86: lib_System.Resources.Reader.dll.so => 99
	i64 u0x125b7f94acb989db, ; 87: Xamarin.AndroidX.RecyclerView.dll => 272
	i64 u0x126ee4b0de53cbfd, ; 88: Microsoft.IdentityModel.Protocols.OpenIdConnect.dll => 197
	i64 u0x12d3b63863d4ab0b, ; 89: lib_System.Threading.Overlapped.dll.so => 141
	i64 u0x134eab1061c395ee, ; 90: System.Transactions => 151
	i64 u0x138567fa954faa55, ; 91: Xamarin.AndroidX.Browser => 226
	i64 u0x13a01de0cbc3f06c, ; 92: lib-fr-Microsoft.Maui.Controls.resources.dll.so => 325
	i64 u0x13beedefb0e28a45, ; 93: lib_System.Xml.XmlDocument.dll.so => 162
	i64 u0x13f1e5e209e91af4, ; 94: lib_Java.Interop.dll.so => 169
	i64 u0x13f1e880c25d96d1, ; 95: he/Microsoft.Maui.Controls.resources => 326
	i64 u0x143a1f6e62b82b56, ; 96: Microsoft.IdentityModel.Protocols.OpenIdConnect => 197
	i64 u0x143d8ea60a6a4011, ; 97: Microsoft.Extensions.DependencyInjection.Abstractions => 185
	i64 u0x1497051b917530bd, ; 98: lib_System.Net.WebSockets.dll.so => 81
	i64 u0x14e68447938213b7, ; 99: Xamarin.AndroidX.Collection.Ktx.dll => 230
	i64 u0x152a448bd1e745a7, ; 100: Microsoft.Win32.Primitives => 4
	i64 u0x1557de0138c445f4, ; 101: lib_Microsoft.Win32.Registry.dll.so => 5
	i64 u0x159cc6c81072f00e, ; 102: lib_System.Diagnostics.EventLog.dll.so => 208
	i64 u0x15bdc156ed462f2f, ; 103: lib_System.IO.FileSystem.dll.so => 51
	i64 u0x15e300c2c1668655, ; 104: System.Resources.Writer.dll => 101
	i64 u0x162be8a76b00cd97, ; 105: lib-de-Microsoft.Data.SqlClient.resources.dll.so => 305
	i64 u0x16bf2a22df043a09, ; 106: System.IO.Pipes.dll => 56
	i64 u0x16ea2b318ad2d830, ; 107: System.Security.Cryptography.Algorithms => 120
	i64 u0x16eeae54c7ebcc08, ; 108: System.Reflection.dll => 98
	i64 u0x17125c9a85b4929f, ; 109: lib_netstandard.dll.so => 168
	i64 u0x1716866f7416792e, ; 110: lib_System.Security.AccessControl.dll.so => 118
	i64 u0x174f71c46216e44a, ; 111: Xamarin.KotlinX.Coroutines.Core => 300
	i64 u0x1752c12f1e1fc00c, ; 112: System.Core => 21
	i64 u0x17b56e25558a5d36, ; 113: lib-hu-Microsoft.Maui.Controls.resources.dll.so => 329
	i64 u0x17f9358913beb16a, ; 114: System.Text.Encodings.Web => 137
	i64 u0x1809fb23f29ba44a, ; 115: lib_System.Reflection.TypeExtensions.dll.so => 97
	i64 u0x18402a709e357f3b, ; 116: lib_Xamarin.KotlinX.Serialization.Core.Jvm.dll.so => 303
	i64 u0x18a9befae51bb361, ; 117: System.Net.WebClient => 77
	i64 u0x18f0ce884e87d89a, ; 118: nb/Microsoft.Maui.Controls.resources.dll => 335
	i64 u0x193d7a04b7eda8bc, ; 119: lib_Xamarin.AndroidX.Print.dll.so => 270
	i64 u0x19777fba3c41b398, ; 120: Xamarin.AndroidX.Startup.StartupRuntime.dll => 278
	i64 u0x19a4c090f14ebb66, ; 121: System.Security.Claims => 119
	i64 u0x1a6fceea64859810, ; 122: Azure.Identity => 175
	i64 u0x1a91866a319e9259, ; 123: lib_System.Collections.Concurrent.dll.so => 8
	i64 u0x1aac34d1917ba5d3, ; 124: lib_System.dll.so => 165
	i64 u0x1aad60783ffa3e5b, ; 125: lib-th-Microsoft.Maui.Controls.resources.dll.so => 344
	i64 u0x1aea8f1c3b282172, ; 126: lib_System.Net.Ping.dll.so => 70
	i64 u0x1b4b7a1d0d265fa2, ; 127: Xamarin.Android.Glide.DiskLruCache => 215
	i64 u0x1bbdb16cfa73e785, ; 128: Xamarin.AndroidX.Lifecycle.Runtime.Ktx.Android => 259
	i64 u0x1bc766e07b2b4241, ; 129: Xamarin.AndroidX.ResourceInspection.Annotation.dll => 273
	i64 u0x1c753b5ff15bce1b, ; 130: Mono.Android.Runtime.dll => 171
	i64 u0x1cd47467799d8250, ; 131: System.Threading.Tasks.dll => 145
	i64 u0x1d23eafdc6dc346c, ; 132: System.Globalization.Calendars.dll => 40
	i64 u0x1da4110562816681, ; 133: Xamarin.AndroidX.Security.SecurityCrypto.dll => 276
	i64 u0x1db6820994506bf5, ; 134: System.IO.FileSystem.AccessControl.dll => 47
	i64 u0x1dbb0c2c6a999acb, ; 135: System.Diagnostics.StackTrace => 30
	i64 u0x1e3d87657e9659bc, ; 136: Xamarin.AndroidX.Navigation.UI => 269
	i64 u0x1e71143913d56c10, ; 137: lib-ko-Microsoft.Maui.Controls.resources.dll.so => 333
	i64 u0x1e7c31185e2fb266, ; 138: lib_System.Threading.Tasks.Parallel.dll.so => 144
	i64 u0x1ed8fcce5e9b50a0, ; 139: Microsoft.Extensions.Options.dll => 189
	i64 u0x1f055d15d807e1b2, ; 140: System.Xml.XmlSerializer => 163
	i64 u0x1f1ed22c1085f044, ; 141: lib_System.Diagnostics.FileVersionInfo.dll.so => 28
	i64 u0x1f61df9c5b94d2c1, ; 142: lib_System.Numerics.dll.so => 84
	i64 u0x1f750bb5421397de, ; 143: lib_Xamarin.AndroidX.Tracing.Tracing.dll.so => 280
	i64 u0x20237ea48006d7a8, ; 144: lib_System.Net.WebClient.dll.so => 77
	i64 u0x209375905fcc1bad, ; 145: lib_System.IO.Compression.Brotli.dll.so => 43
	i64 u0x20fab3cf2dfbc8df, ; 146: lib_System.Diagnostics.Process.dll.so => 29
	i64 u0x2110167c128cba15, ; 147: System.Globalization => 42
	i64 u0x21419508838f7547, ; 148: System.Runtime.CompilerServices.VisualC => 103
	i64 u0x2174319c0d835bc9, ; 149: System.Runtime => 117
	i64 u0x2198e5bc8b7153fa, ; 150: Xamarin.AndroidX.Annotation.Experimental.dll => 220
	i64 u0x2199f06354c82d3b, ; 151: System.ClientModel.dll => 205
	i64 u0x219ea1b751a4dee4, ; 152: lib_System.IO.Compression.ZipFile.dll.so => 45
	i64 u0x21cc7e445dcd5469, ; 153: System.Reflection.Emit.ILGeneration => 91
	i64 u0x220fd4f2e7c48170, ; 154: th/Microsoft.Maui.Controls.resources => 344
	i64 u0x224538d85ed15a82, ; 155: System.IO.Pipes => 56
	i64 u0x22908438c6bed1af, ; 156: lib_System.Threading.Timer.dll.so => 148
	i64 u0x237be844f1f812c7, ; 157: System.Threading.Thread.dll => 146
	i64 u0x23852b3bdc9f7096, ; 158: System.Resources.ResourceManager => 100
	i64 u0x23986dd7e5d4fc01, ; 159: System.IO.FileSystem.Primitives.dll => 49
	i64 u0x23f599165f90dd7a, ; 160: lib-cs-Microsoft.Data.SqlClient.resources.dll.so => 304
	i64 u0x2407aef2bbe8fadf, ; 161: System.Console => 20
	i64 u0x240abe014b27e7d3, ; 162: Xamarin.AndroidX.Core.dll => 235
	i64 u0x247619fe4413f8bf, ; 163: System.Runtime.Serialization.Primitives.dll => 114
	i64 u0x24de8d301281575e, ; 164: Xamarin.Android.Glide => 213
	i64 u0x252073cc3caa62c2, ; 165: fr/Microsoft.Maui.Controls.resources.dll => 325
	i64 u0x256b8d41255f01b1, ; 166: Xamarin.Google.Crypto.Tink.Android => 291
	i64 u0x2662c629b96b0b30, ; 167: lib_Xamarin.Kotlin.StdLib.dll.so => 295
	i64 u0x268c1439f13bcc29, ; 168: lib_Microsoft.Extensions.Primitives.dll.so => 190
	i64 u0x26a670e154a9c54b, ; 169: System.Reflection.Extensions.dll => 94
	i64 u0x26d077d9678fe34f, ; 170: System.IO.dll => 58
	i64 u0x270a44600c921861, ; 171: System.IdentityModel.Tokens.Jwt => 209
	i64 u0x273f3515de5faf0d, ; 172: id/Microsoft.Maui.Controls.resources.dll => 330
	i64 u0x2742545f9094896d, ; 173: hr/Microsoft.Maui.Controls.resources => 328
	i64 u0x2759af78ab94d39b, ; 174: System.Net.WebSockets => 81
	i64 u0x27b2b16f3e9de038, ; 175: Xamarin.Google.Crypto.Tink.Android.dll => 291
	i64 u0x27b410442fad6cf1, ; 176: Java.Interop.dll => 169
	i64 u0x27b97e0d52c3034a, ; 177: System.Diagnostics.Debug => 26
	i64 u0x2801845a2c71fbfb, ; 178: System.Net.Primitives.dll => 71
	i64 u0x286835e259162700, ; 179: lib_Xamarin.AndroidX.ProfileInstaller.ProfileInstaller.dll.so => 271
	i64 u0x2949f3617a02c6b2, ; 180: Xamarin.AndroidX.ExifInterface => 245
	i64 u0x2a128783efe70ba0, ; 181: uk/Microsoft.Maui.Controls.resources.dll => 346
	i64 u0x2a3b095612184159, ; 182: lib_System.Net.NetworkInformation.dll.so => 69
	i64 u0x2a6507a5ffabdf28, ; 183: System.Diagnostics.TraceSource.dll => 33
	i64 u0x2ad156c8e1354139, ; 184: fi/Microsoft.Maui.Controls.resources => 324
	i64 u0x2ad5d6b13b7a3e04, ; 185: System.ComponentModel.DataAnnotations.dll => 14
	i64 u0x2af298f63581d886, ; 186: System.Text.RegularExpressions.dll => 139
	i64 u0x2af615542f04da50, ; 187: System.IdentityModel.Tokens.Jwt.dll => 209
	i64 u0x2afc1c4f898552ee, ; 188: lib_System.Formats.Asn1.dll.so => 38
	i64 u0x2b148910ed40fbf9, ; 189: zh-Hant/Microsoft.Maui.Controls.resources.dll => 350
	i64 u0x2b6989d78cba9a15, ; 190: Xamarin.AndroidX.Concurrent.Futures.dll => 231
	i64 u0x2c8bd14bb93a7d82, ; 191: lib-pl-Microsoft.Maui.Controls.resources.dll.so => 337
	i64 u0x2cbd9262ca785540, ; 192: lib_System.Text.Encoding.CodePages.dll.so => 134
	i64 u0x2cc9e1fed6257257, ; 193: lib_System.Reflection.Emit.Lightweight.dll.so => 92
	i64 u0x2cd723e9fe623c7c, ; 194: lib_System.Private.Xml.Linq.dll.so => 88
	i64 u0x2ce66f4c8733e883, ; 195: pt-BR/Microsoft.Data.SqlClient.resources.dll => 312
	i64 u0x2d169d318a968379, ; 196: System.Threading.dll => 149
	i64 u0x2d47774b7d993f59, ; 197: sv/Microsoft.Maui.Controls.resources.dll => 343
	i64 u0x2d5ffcae1ad0aaca, ; 198: System.Data.dll => 24
	i64 u0x2db915caf23548d2, ; 199: System.Text.Json.dll => 138
	i64 u0x2dcaa0bb15a4117a, ; 200: System.IO.UnmanagedMemoryStream.dll => 57
	i64 u0x2e5a40c319acb800, ; 201: System.IO.FileSystem => 51
	i64 u0x2e6f1f226821322a, ; 202: el/Microsoft.Maui.Controls.resources.dll => 322
	i64 u0x2f02f94df3200fe5, ; 203: System.Diagnostics.Process => 29
	i64 u0x2f2e98e1c89b1aff, ; 204: System.Xml.ReaderWriter => 157
	i64 u0x2f40b2521deba305, ; 205: lib_Microsoft.SqlServer.Server.dll.so => 204
	i64 u0x2f5911d9ba814e4e, ; 206: System.Diagnostics.Tracing => 34
	i64 u0x2f84070a459bc31f, ; 207: lib_System.Xml.dll.so => 164
	i64 u0x2feb4d2fcda05cfd, ; 208: Microsoft.Extensions.Caching.Abstractions.dll => 180
	i64 u0x309ee9eeec09a71e, ; 209: lib_Xamarin.AndroidX.Fragment.dll.so => 246
	i64 u0x309f2bedefa9a318, ; 210: Microsoft.IdentityModel.Abstractions => 193
	i64 u0x30c6dda129408828, ; 211: System.IO.IsolatedStorage => 52
	i64 u0x31195fef5d8fb552, ; 212: _Microsoft.Android.Resource.Designer.dll => 351
	i64 u0x312c8ed623cbfc8d, ; 213: Xamarin.AndroidX.Window.dll => 287
	i64 u0x31496b779ed0663d, ; 214: lib_System.Reflection.DispatchProxy.dll.so => 90
	i64 u0x32243413e774362a, ; 215: Xamarin.AndroidX.CardView.dll => 227
	i64 u0x3235427f8d12dae1, ; 216: lib_System.Drawing.Primitives.dll.so => 35
	i64 u0x329753a17a517811, ; 217: fr/Microsoft.Maui.Controls.resources => 325
	i64 u0x32aa989ff07a84ff, ; 218: lib_System.Xml.ReaderWriter.dll.so => 157
	i64 u0x33829542f112d59b, ; 219: System.Collections.Immutable => 9
	i64 u0x33a31443733849fe, ; 220: lib-es-Microsoft.Maui.Controls.resources.dll.so => 323
	i64 u0x341abc357fbb4ebf, ; 221: lib_System.Net.Sockets.dll.so => 76
	i64 u0x348d598f4054415e, ; 222: Microsoft.SqlServer.Server => 204
	i64 u0x3496c1e2dcaf5ecc, ; 223: lib_System.IO.Pipes.AccessControl.dll.so => 55
	i64 u0x34dfd74fe2afcf37, ; 224: Microsoft.Maui => 201
	i64 u0x34e292762d9615df, ; 225: cs/Microsoft.Maui.Controls.resources.dll => 319
	i64 u0x3508234247f48404, ; 226: Microsoft.Maui.Controls => 199
	i64 u0x353590da528c9d22, ; 227: System.ComponentModel.Annotations => 13
	i64 u0x3549870798b4cd30, ; 228: lib_Xamarin.AndroidX.ViewPager2.dll.so => 286
	i64 u0x355282fc1c909694, ; 229: Microsoft.Extensions.Configuration => 182
	i64 u0x3552fc5d578f0fbf, ; 230: Xamarin.AndroidX.Arch.Core.Common => 224
	i64 u0x355c649948d55d97, ; 231: lib_System.Runtime.Intrinsics.dll.so => 109
	i64 u0x35ea9d1c6834bc8c, ; 232: Xamarin.AndroidX.Lifecycle.ViewModel.Ktx.dll => 262
	i64 u0x3628ab68db23a01a, ; 233: lib_System.Diagnostics.Tools.dll.so => 32
	i64 u0x3673b042508f5b6b, ; 234: lib_System.Runtime.Extensions.dll.so => 104
	i64 u0x36740f1a8ecdc6c4, ; 235: System.Numerics => 84
	i64 u0x36b2b50fdf589ae2, ; 236: System.Reflection.Emit.Lightweight => 92
	i64 u0x36cada77dc79928b, ; 237: System.IO.MemoryMappedFiles => 53
	i64 u0x374ef46b06791af6, ; 238: System.Reflection.Primitives.dll => 96
	i64 u0x376bf93e521a5417, ; 239: lib_Xamarin.Jetbrains.Annotations.dll.so => 294
	i64 u0x37bc29f3183003b6, ; 240: lib_System.IO.dll.so => 58
	i64 u0x380134e03b1e160a, ; 241: System.Collections.Immutable.dll => 9
	i64 u0x38049b5c59b39324, ; 242: System.Runtime.CompilerServices.Unsafe => 102
	i64 u0x382b20286945c849, ; 243: lib_Microsoft.Bcl.Cryptography.dll.so => 178
	i64 u0x385c17636bb6fe6e, ; 244: Xamarin.AndroidX.CustomView.dll => 238
	i64 u0x38869c811d74050e, ; 245: System.Net.NameResolution.dll => 68
	i64 u0x38e93ec1c057cdf6, ; 246: Microsoft.IdentityModel.Protocols => 196
	i64 u0x39251dccb84bdcaa, ; 247: lib_System.Configuration.ConfigurationManager.dll.so => 206
	i64 u0x393c226616977fdb, ; 248: lib_Xamarin.AndroidX.ViewPager.dll.so => 285
	i64 u0x395e37c3334cf82a, ; 249: lib-ca-Microsoft.Maui.Controls.resources.dll.so => 318
	i64 u0x3ab5859054645f72, ; 250: System.Security.Cryptography.Primitives.dll => 125
	i64 u0x3ad75090c3fac0e9, ; 251: lib_Xamarin.AndroidX.ResourceInspection.Annotation.dll.so => 273
	i64 u0x3ae44ac43a1fbdbb, ; 252: System.Runtime.Serialization => 116
	i64 u0x3b860f9932505633, ; 253: lib_System.Text.Encoding.Extensions.dll.so => 135
	i64 u0x3bea9ebe8c027c01, ; 254: lib_Microsoft.IdentityModel.Tokens.dll.so => 198
	i64 u0x3c3aafb6b3a00bf6, ; 255: lib_System.Security.Cryptography.X509Certificates.dll.so => 126
	i64 u0x3c4049146b59aa90, ; 256: System.Runtime.InteropServices.JavaScript => 106
	i64 u0x3c5f19e4acdcebd8, ; 257: lib_Microsoft.Data.SqlClient.dll.so => 179
	i64 u0x3c7c495f58ac5ee9, ; 258: Xamarin.Kotlin.StdLib => 295
	i64 u0x3c7e5ed3d5db71bb, ; 259: System.Security => 131
	i64 u0x3cd9d281d402eb9b, ; 260: Xamarin.AndroidX.Browser.dll => 226
	i64 u0x3d196e782ed8c01a, ; 261: System.Data.SqlClient => 207
	i64 u0x3d1c50cc001a991e, ; 262: Xamarin.Google.Guava.ListenableFuture.dll => 293
	i64 u0x3d2b1913edfc08d7, ; 263: lib_System.Threading.ThreadPool.dll.so => 147
	i64 u0x3d46f0b995082740, ; 264: System.Xml.Linq => 156
	i64 u0x3d8a8f400514a790, ; 265: Xamarin.AndroidX.Fragment.Ktx.dll => 247
	i64 u0x3d9c2a242b040a50, ; 266: lib_Xamarin.AndroidX.Core.dll.so => 235
	i64 u0x3dbb6b9f5ab90fa7, ; 267: lib_Xamarin.AndroidX.DynamicAnimation.dll.so => 242
	i64 u0x3e0b360b2840f096, ; 268: it/Microsoft.Data.SqlClient.resources => 308
	i64 u0x3e5441657549b213, ; 269: Xamarin.AndroidX.ResourceInspection.Annotation => 273
	i64 u0x3e57d4d195c53c2e, ; 270: System.Reflection.TypeExtensions => 97
	i64 u0x3e616ab4ed1f3f15, ; 271: lib_System.Data.dll.so => 24
	i64 u0x3f1d226e6e06db7e, ; 272: Xamarin.AndroidX.SlidingPaneLayout.dll => 277
	i64 u0x3f3c8f45ab6f28c7, ; 273: Microsoft.Identity.Client.Extensions.Msal.dll => 192
	i64 u0x3f510adf788828dd, ; 274: System.Threading.Tasks.Extensions => 143
	i64 u0x407740ff2e914d86, ; 275: Xamarin.AndroidX.Print.dll => 270
	i64 u0x407a10bb4bf95829, ; 276: lib_Xamarin.AndroidX.Navigation.Common.dll.so => 266
	i64 u0x407ac43dee26bd5a, ; 277: lib_Azure.Identity.dll.so => 175
	i64 u0x40c98b6bd77346d4, ; 278: Microsoft.VisualBasic.dll => 3
	i64 u0x415e36f6b13ff6f3, ; 279: System.Configuration.ConfigurationManager.dll => 206
	i64 u0x41833cf766d27d96, ; 280: mscorlib => 167
	i64 u0x41cab042be111c34, ; 281: lib_Xamarin.AndroidX.AppCompat.AppCompatResources.dll.so => 223
	i64 u0x423a9ecc4d905a88, ; 282: lib_System.Resources.ResourceManager.dll.so => 100
	i64 u0x423bf51ae7def810, ; 283: System.Xml.XPath => 161
	i64 u0x42462ff15ddba223, ; 284: System.Resources.Reader.dll => 99
	i64 u0x42a31b86e6ccc3f0, ; 285: System.Diagnostics.Contracts => 25
	i64 u0x430e95b891249788, ; 286: lib_System.Reflection.Emit.dll.so => 93
	i64 u0x43375950ec7c1b6a, ; 287: netstandard.dll => 168
	i64 u0x434c4e1d9284cdae, ; 288: Mono.Android.dll => 172
	i64 u0x43505013578652a0, ; 289: lib_Xamarin.AndroidX.Activity.Ktx.dll.so => 218
	i64 u0x437d06c381ed575a, ; 290: lib_Microsoft.VisualBasic.dll.so => 3
	i64 u0x43950f84de7cc79a, ; 291: pl/Microsoft.Maui.Controls.resources.dll => 337
	i64 u0x43e8ca5bc927ff37, ; 292: lib_Xamarin.AndroidX.Emoji2.ViewsHelper.dll.so => 244
	i64 u0x448bd33429269b19, ; 293: Microsoft.CSharp => 1
	i64 u0x4499fa3c8e494654, ; 294: lib_System.Runtime.Serialization.Primitives.dll.so => 114
	i64 u0x4515080865a951a5, ; 295: Xamarin.Kotlin.StdLib.dll => 295
	i64 u0x4545802489b736b9, ; 296: Xamarin.AndroidX.Fragment.Ktx => 247
	i64 u0x454b4d1e66bb783c, ; 297: Xamarin.AndroidX.Lifecycle.Process => 255
	i64 u0x458d2df79ac57c1d, ; 298: lib_System.IdentityModel.Tokens.Jwt.dll.so => 209
	i64 u0x45c40276a42e283e, ; 299: System.Diagnostics.TraceSource => 33
	i64 u0x45d443f2a29adc37, ; 300: System.AppContext.dll => 6
	i64 u0x46a4213bc97fe5ae, ; 301: lib-ru-Microsoft.Maui.Controls.resources.dll.so => 341
	i64 u0x47358bd471172e1d, ; 302: lib_System.Xml.Linq.dll.so => 156
	i64 u0x4787a936949fcac2, ; 303: System.Memory.Data.dll => 210
	i64 u0x47daf4e1afbada10, ; 304: pt/Microsoft.Maui.Controls.resources => 339
	i64 u0x480c0a47dd42dd81, ; 305: lib_System.IO.MemoryMappedFiles.dll.so => 53
	i64 u0x484178f34685f764, ; 306: lib_MediQ.dll.so => 0
	i64 u0x488d293220a4fe37, ; 307: Xamarin.AndroidX.Legacy.Support.Core.Utils.dll => 249
	i64 u0x49e952f19a4e2022, ; 308: System.ObjectModel => 85
	i64 u0x49f9e6948a8131e4, ; 309: lib_Xamarin.AndroidX.VersionedParcelable.dll.so => 284
	i64 u0x4a5667b2462a664b, ; 310: lib_Xamarin.AndroidX.Navigation.UI.dll.so => 269
	i64 u0x4a7a18981dbd56bc, ; 311: System.IO.Compression.FileSystem.dll => 44
	i64 u0x4aa5c60350917c06, ; 312: lib_Xamarin.AndroidX.Lifecycle.LiveData.Core.Ktx.dll.so => 254
	i64 u0x4b07a0ed0ab33ff4, ; 313: System.Runtime.Extensions.dll => 104
	i64 u0x4b576d47ac054f3c, ; 314: System.IO.FileSystem.AccessControl => 47
	i64 u0x4b7b6532ded934b7, ; 315: System.Text.Json => 138
	i64 u0x4b8f8ea3c2df6bb0, ; 316: System.ClientModel => 205
	i64 u0x4c7755cf07ad2d5f, ; 317: System.Net.Http.Json.dll => 64
	i64 u0x4cc5f15266470798, ; 318: lib_Xamarin.AndroidX.Loader.dll.so => 264
	i64 u0x4cf6f67dc77aacd2, ; 319: System.Net.NetworkInformation.dll => 69
	i64 u0x4d3183dd245425d4, ; 320: System.Net.WebSockets.Client.dll => 80
	i64 u0x4d479f968a05e504, ; 321: System.Linq.Expressions.dll => 59
	i64 u0x4d55a010ffc4faff, ; 322: System.Private.Xml => 89
	i64 u0x4d5cbe77561c5b2e, ; 323: System.Web.dll => 154
	i64 u0x4d6001db23f8cd87, ; 324: lib_System.ClientModel.dll.so => 205
	i64 u0x4d77512dbd86ee4c, ; 325: lib_Xamarin.AndroidX.Arch.Core.Common.dll.so => 224
	i64 u0x4d7793536e79c309, ; 326: System.ServiceProcess => 133
	i64 u0x4d95fccc1f67c7ca, ; 327: System.Runtime.Loader.dll => 110
	i64 u0x4dcf44c3c9b076a2, ; 328: it/Microsoft.Maui.Controls.resources.dll => 331
	i64 u0x4dd9247f1d2c3235, ; 329: Xamarin.AndroidX.Loader.dll => 264
	i64 u0x4e2aeee78e2c4a87, ; 330: Xamarin.AndroidX.ProfileInstaller.ProfileInstaller => 271
	i64 u0x4e32f00cb0937401, ; 331: Mono.Android.Runtime => 171
	i64 u0x4e5eea4668ac2b18, ; 332: System.Text.Encoding.CodePages => 134
	i64 u0x4ebd0c4b82c5eefc, ; 333: lib_System.Threading.Channels.dll.so => 140
	i64 u0x4ee8eaa9c9c1151a, ; 334: System.Globalization.Calendars => 40
	i64 u0x4f21ee6ef9eb527e, ; 335: ca/Microsoft.Maui.Controls.resources => 318
	i64 u0x4f27ca9d6e02176c, ; 336: cs/Microsoft.Data.SqlClient.resources => 304
	i64 u0x4ffd65baff757598, ; 337: Microsoft.IdentityModel.Tokens => 198
	i64 u0x50320f2a19424f3f, ; 338: lib-it-Microsoft.Data.SqlClient.resources.dll.so => 308
	i64 u0x5037f0be3c28c7a3, ; 339: lib_Microsoft.Maui.Controls.dll.so => 199
	i64 u0x50c3a29b21050d45, ; 340: System.Linq.Parallel.dll => 60
	i64 u0x5131bbe80989093f, ; 341: Xamarin.AndroidX.Lifecycle.ViewModel.Android.dll => 261
	i64 u0x5146d4e23aed3198, ; 342: ja/Microsoft.Data.SqlClient.resources => 309
	i64 u0x516324a5050a7e3c, ; 343: System.Net.WebProxy => 79
	i64 u0x516d6f0b21a303de, ; 344: lib_System.Diagnostics.Contracts.dll.so => 25
	i64 u0x51bb8a2afe774e32, ; 345: System.Drawing => 36
	i64 u0x5247c5c32a4140f0, ; 346: System.Resources.Reader => 99
	i64 u0x526bb15e3c386364, ; 347: Xamarin.AndroidX.Lifecycle.Runtime.Ktx.dll => 258
	i64 u0x526ce79eb8e90527, ; 348: lib_System.Net.Primitives.dll.so => 71
	i64 u0x52829f00b4467c38, ; 349: lib_System.Data.Common.dll.so => 22
	i64 u0x5290402954d7bce0, ; 350: zh-Hans/Microsoft.Data.SqlClient.resources => 315
	i64 u0x529ffe06f39ab8db, ; 351: Xamarin.AndroidX.Core => 235
	i64 u0x52ff996554dbf352, ; 352: Microsoft.Maui.Graphics => 203
	i64 u0x535f7e40e8fef8af, ; 353: lib-sk-Microsoft.Maui.Controls.resources.dll.so => 342
	i64 u0x53978aac584c666e, ; 354: lib_System.Security.Cryptography.Cng.dll.so => 121
	i64 u0x53a96d5c86c9e194, ; 355: System.Net.NetworkInformation => 69
	i64 u0x53be1038a61e8d44, ; 356: System.Runtime.InteropServices.RuntimeInformation.dll => 107
	i64 u0x53c3014b9437e684, ; 357: lib-zh-HK-Microsoft.Maui.Controls.resources.dll.so => 348
	i64 u0x53e450ebd586f842, ; 358: lib_Xamarin.AndroidX.LocalBroadcastManager.dll.so => 265
	i64 u0x5435e6f049e9bc37, ; 359: System.Security.Claims.dll => 119
	i64 u0x54795225dd1587af, ; 360: lib_System.Runtime.dll.so => 117
	i64 u0x547a34f14e5f6210, ; 361: Xamarin.AndroidX.Lifecycle.Common.dll => 250
	i64 u0x556e8b63b660ab8b, ; 362: Xamarin.AndroidX.Lifecycle.Common.Jvm.dll => 251
	i64 u0x5588627c9a108ec9, ; 363: System.Collections.Specialized => 11
	i64 u0x55a898e4f42e3fae, ; 364: Microsoft.VisualBasic.Core.dll => 2
	i64 u0x55fa0c610fe93bb1, ; 365: lib_System.Security.Cryptography.OpenSsl.dll.so => 124
	i64 u0x56442b99bc64bb47, ; 366: System.Runtime.Serialization.Xml.dll => 115
	i64 u0x56a8b26e1aeae27b, ; 367: System.Threading.Tasks.Dataflow => 142
	i64 u0x56f932d61e93c07f, ; 368: System.Globalization.Extensions => 41
	i64 u0x571c5cfbec5ae8e2, ; 369: System.Private.Uri => 87
	i64 u0x576499c9f52fea31, ; 370: Xamarin.AndroidX.Annotation => 219
	i64 u0x579a06fed6eec900, ; 371: System.Private.CoreLib.dll => 173
	i64 u0x57c542c14049b66d, ; 372: System.Diagnostics.DiagnosticSource => 27
	i64 u0x581a8bd5cfda563e, ; 373: System.Threading.Timer => 148
	i64 u0x58601b2dda4a27b9, ; 374: lib-ja-Microsoft.Maui.Controls.resources.dll.so => 332
	i64 u0x58688d9af496b168, ; 375: Microsoft.Extensions.DependencyInjection.dll => 184
	i64 u0x588c167a79db6bfb, ; 376: lib_Xamarin.Google.ErrorProne.Annotations.dll.so => 292
	i64 u0x5906028ae5151104, ; 377: Xamarin.AndroidX.Activity.Ktx => 218
	i64 u0x595a356d23e8da9a, ; 378: lib_Microsoft.CSharp.dll.so => 1
	i64 u0x59f9e60b9475085f, ; 379: lib_Xamarin.AndroidX.Annotation.Experimental.dll.so => 220
	i64 u0x5a70033ca9d003cb, ; 380: lib_System.Memory.Data.dll.so => 210
	i64 u0x5a745f5101a75527, ; 381: lib_System.IO.Compression.FileSystem.dll.so => 44
	i64 u0x5a89a886ae30258d, ; 382: lib_Xamarin.AndroidX.CoordinatorLayout.dll.so => 234
	i64 u0x5a8f6699f4a1caa9, ; 383: lib_System.Threading.dll.so => 149
	i64 u0x5a970fdd71061d98, ; 384: MediQ => 0
	i64 u0x5ae8e4f3eae4d547, ; 385: Xamarin.AndroidX.Legacy.Support.Core.Utils => 249
	i64 u0x5ae9cd33b15841bf, ; 386: System.ComponentModel => 18
	i64 u0x5b54391bdc6fcfe6, ; 387: System.Private.DataContractSerialization => 86
	i64 u0x5b5f0e240a06a2a2, ; 388: da/Microsoft.Maui.Controls.resources.dll => 320
	i64 u0x5b8109e8e14c5e3e, ; 389: System.Globalization.Extensions.dll => 41
	i64 u0x5bddd04d72a9e350, ; 390: Xamarin.AndroidX.Lifecycle.LiveData.Core.Ktx => 254
	i64 u0x5bdf16b09da116ab, ; 391: Xamarin.AndroidX.Collection => 228
	i64 u0x5bf46332cc09e9b2, ; 392: lib_System.Data.SqlClient.dll.so => 207
	i64 u0x5c019d5266093159, ; 393: lib_Xamarin.AndroidX.Lifecycle.Runtime.Ktx.Android.dll.so => 259
	i64 u0x5c30a4a35f9cc8c4, ; 394: lib_System.Reflection.Extensions.dll.so => 94
	i64 u0x5c393624b8176517, ; 395: lib_Microsoft.Extensions.Logging.dll.so => 186
	i64 u0x5c53c29f5073b0c9, ; 396: System.Diagnostics.FileVersionInfo => 28
	i64 u0x5c87463c575c7616, ; 397: lib_System.Globalization.Extensions.dll.so => 41
	i64 u0x5d0a4a29b02d9d3c, ; 398: System.Net.WebHeaderCollection.dll => 78
	i64 u0x5d33da2f84c1de97, ; 399: lib-pt-BR-Microsoft.Data.SqlClient.resources.dll.so => 312
	i64 u0x5d40c9b15181641f, ; 400: lib_Xamarin.AndroidX.Emoji2.dll.so => 243
	i64 u0x5d6ca10d35e9485b, ; 401: lib_Xamarin.AndroidX.Concurrent.Futures.dll.so => 231
	i64 u0x5d7960d446a1890e, ; 402: lib-pl-Microsoft.Data.SqlClient.resources.dll.so => 311
	i64 u0x5d7ec76c1c703055, ; 403: System.Threading.Tasks.Parallel => 144
	i64 u0x5db0cbbd1028510e, ; 404: lib_System.Runtime.InteropServices.dll.so => 108
	i64 u0x5db30905d3e5013b, ; 405: Xamarin.AndroidX.Collection.Jvm.dll => 229
	i64 u0x5e467bc8f09ad026, ; 406: System.Collections.Specialized.dll => 11
	i64 u0x5e5173b3208d97e7, ; 407: System.Runtime.Handles.dll => 105
	i64 u0x5ea92fdb19ec8c4c, ; 408: System.Text.Encodings.Web.dll => 137
	i64 u0x5eb8046dd40e9ac3, ; 409: System.ComponentModel.Primitives => 16
	i64 u0x5ec272d219c9aba4, ; 410: System.Security.Cryptography.Csp.dll => 122
	i64 u0x5eee1376d94c7f5e, ; 411: System.Net.HttpListener.dll => 66
	i64 u0x5f36ccf5c6a57e24, ; 412: System.Xml.ReaderWriter.dll => 157
	i64 u0x5f4294b9b63cb842, ; 413: System.Data.Common => 22
	i64 u0x5f9a2d823f664957, ; 414: lib-el-Microsoft.Maui.Controls.resources.dll.so => 322
	i64 u0x5fa6da9c3cd8142a, ; 415: lib_Xamarin.KotlinX.Serialization.Core.dll.so => 302
	i64 u0x5fac98e0b37a5b9d, ; 416: System.Runtime.CompilerServices.Unsafe.dll => 102
	i64 u0x609f4b7b63d802d4, ; 417: lib_Microsoft.Extensions.DependencyInjection.dll.so => 184
	i64 u0x60cd4e33d7e60134, ; 418: Xamarin.KotlinX.Coroutines.Core.Jvm => 301
	i64 u0x60f62d786afcf130, ; 419: System.Memory => 63
	i64 u0x61bb78c89f867353, ; 420: System.IO => 58
	i64 u0x61be8d1299194243, ; 421: Microsoft.Maui.Controls.Xaml => 200
	i64 u0x61d2cba29557038f, ; 422: de/Microsoft.Maui.Controls.resources => 321
	i64 u0x61d88f399afb2f45, ; 423: lib_System.Runtime.Loader.dll.so => 110
	i64 u0x6219beeff33faa04, ; 424: cs/Microsoft.Data.SqlClient.resources.dll => 304
	i64 u0x622eef6f9e59068d, ; 425: System.Private.CoreLib => 173
	i64 u0x625def565caafc1c, ; 426: tr/Microsoft.Data.SqlClient.resources.dll => 314
	i64 u0x62812a93be7f3265, ; 427: Microsoft.Bcl.Cryptography => 178
	i64 u0x63d5e3aa4ef9b931, ; 428: Xamarin.KotlinX.Coroutines.Android.dll => 299
	i64 u0x63f1f6883c1e23c2, ; 429: lib_System.Collections.Immutable.dll.so => 9
	i64 u0x6400f68068c1e9f1, ; 430: Xamarin.Google.Android.Material.dll => 289
	i64 u0x640e3b14dbd325c2, ; 431: System.Security.Cryptography.Algorithms.dll => 120
	i64 u0x64587004560099b9, ; 432: System.Reflection => 98
	i64 u0x6468947914df5c9c, ; 433: Microsoft.Bcl.Cryptography.dll => 178
	i64 u0x64b1529a438a3c45, ; 434: lib_System.Runtime.Handles.dll.so => 105
	i64 u0x6565fba2cd8f235b, ; 435: Xamarin.AndroidX.Lifecycle.ViewModel.Ktx => 262
	i64 u0x65ecac39144dd3cc, ; 436: Microsoft.Maui.Controls.dll => 199
	i64 u0x65ece51227bfa724, ; 437: lib_System.Runtime.Numerics.dll.so => 111
	i64 u0x661722438787b57f, ; 438: Xamarin.AndroidX.Annotation.Jvm.dll => 221
	i64 u0x6679b2337ee6b22a, ; 439: lib_System.IO.FileSystem.Primitives.dll.so => 49
	i64 u0x6692e924eade1b29, ; 440: lib_System.Console.dll.so => 20
	i64 u0x66a4e5c6a3fb0bae, ; 441: lib_Xamarin.AndroidX.Lifecycle.ViewModel.Android.dll.so => 261
	i64 u0x66d13304ce1a3efa, ; 442: Xamarin.AndroidX.CursorAdapter => 237
	i64 u0x674303f65d8fad6f, ; 443: lib_System.Net.Quic.dll.so => 72
	i64 u0x6756ca4cad62e9d6, ; 444: lib_Xamarin.AndroidX.ConstraintLayout.Core.dll.so => 233
	i64 u0x67c0802770244408, ; 445: System.Windows.dll => 155
	i64 u0x68100b69286e27cd, ; 446: lib_System.Formats.Tar.dll.so => 39
	i64 u0x68558ec653afa616, ; 447: lib-da-Microsoft.Maui.Controls.resources.dll.so => 320
	i64 u0x6872ec7a2e36b1ac, ; 448: System.Drawing.Primitives.dll => 35
	i64 u0x68bb2c417aa9b61c, ; 449: Xamarin.KotlinX.AtomicFU.dll => 297
	i64 u0x68fbbbe2eb455198, ; 450: System.Formats.Asn1 => 38
	i64 u0x69063fc0ba8e6bdd, ; 451: he/Microsoft.Maui.Controls.resources.dll => 326
	i64 u0x69a3e26c76f6eec4, ; 452: Xamarin.AndroidX.Window.Extensions.Core.Core.dll => 288
	i64 u0x6a4d7577b2317255, ; 453: System.Runtime.InteropServices.dll => 108
	i64 u0x6ace3b74b15ee4a4, ; 454: nb/Microsoft.Maui.Controls.resources => 335
	i64 u0x6afcedb171067e2b, ; 455: System.Core.dll => 21
	i64 u0x6bef98e124147c24, ; 456: Xamarin.Jetbrains.Annotations => 294
	i64 u0x6ce874bff138ce2b, ; 457: Xamarin.AndroidX.Lifecycle.ViewModel.dll => 260
	i64 u0x6d0a12b2adba20d8, ; 458: System.Security.Cryptography.ProtectedData.dll => 212
	i64 u0x6d12bfaa99c72b1f, ; 459: lib_Microsoft.Maui.Graphics.dll.so => 203
	i64 u0x6d3b7628f8253e93, ; 460: pl/Microsoft.Data.SqlClient.resources => 311
	i64 u0x6d70755158ca866e, ; 461: lib_System.ComponentModel.EventBasedAsync.dll.so => 15
	i64 u0x6d79993361e10ef2, ; 462: Microsoft.Extensions.Primitives => 190
	i64 u0x6d7eeca99577fc8b, ; 463: lib_System.Net.WebProxy.dll.so => 79
	i64 u0x6d8515b19946b6a2, ; 464: System.Net.WebProxy.dll => 79
	i64 u0x6d86d56b84c8eb71, ; 465: lib_Xamarin.AndroidX.CursorAdapter.dll.so => 237
	i64 u0x6d9bea6b3e895cf7, ; 466: Microsoft.Extensions.Primitives.dll => 190
	i64 u0x6dd9bf4083de3f6a, ; 467: Xamarin.AndroidX.DocumentFile.dll => 240
	i64 u0x6e25a02c3833319a, ; 468: lib_Xamarin.AndroidX.Navigation.Fragment.dll.so => 267
	i64 u0x6e79c6bd8627412a, ; 469: Xamarin.AndroidX.SavedState.SavedState.Ktx => 275
	i64 u0x6e838d9a2a6f6c9e, ; 470: lib_System.ValueTuple.dll.so => 152
	i64 u0x6e9965ce1095e60a, ; 471: lib_System.Core.dll.so => 21
	i64 u0x6fd2265da78b93a4, ; 472: lib_Microsoft.Maui.dll.so => 201
	i64 u0x6fdfc7de82c33008, ; 473: cs/Microsoft.Maui.Controls.resources => 319
	i64 u0x6ffc4967cc47ba57, ; 474: System.IO.FileSystem.Watcher.dll => 50
	i64 u0x701cd46a1c25a5fe, ; 475: System.IO.FileSystem.dll => 51
	i64 u0x70c1154d9ce7bd51, ; 476: Xamarin.Kotlin.StdLib.Common.dll => 296
	i64 u0x70e99f48c05cb921, ; 477: tr/Microsoft.Maui.Controls.resources.dll => 345
	i64 u0x70fd3deda22442d2, ; 478: lib-nb-Microsoft.Maui.Controls.resources.dll.so => 335
	i64 u0x71485e7ffdb4b958, ; 479: System.Reflection.Extensions => 94
	i64 u0x7162a2fce67a945f, ; 480: lib_Xamarin.Android.Glide.Annotations.dll.so => 214
	i64 u0x71a495ea3761dde8, ; 481: lib-it-Microsoft.Maui.Controls.resources.dll.so => 331
	i64 u0x71ad672adbe48f35, ; 482: System.ComponentModel.Primitives.dll => 16
	i64 u0x71bc142d620e986a, ; 483: lib_System.Security.Cryptography.Pkcs.dll.so => 211
	i64 u0x725f5a9e82a45c81, ; 484: System.Security.Cryptography.Encoding => 123
	i64 u0x72b1fb4109e08d7b, ; 485: lib-hr-Microsoft.Maui.Controls.resources.dll.so => 328
	i64 u0x72e0300099accce1, ; 486: System.Xml.XPath.XDocument => 160
	i64 u0x730bfb248998f67a, ; 487: System.IO.Compression.ZipFile => 45
	i64 u0x732b2d67b9e5c47b, ; 488: Xamarin.Google.ErrorProne.Annotations.dll => 292
	i64 u0x734b76fdc0dc05bb, ; 489: lib_GoogleGson.dll.so => 176
	i64 u0x73a6be34e822f9d1, ; 490: lib_System.Runtime.Serialization.dll.so => 116
	i64 u0x73e4ce94e2eb6ffc, ; 491: lib_System.Memory.dll.so => 63
	i64 u0x743a1eccf080489a, ; 492: WindowsBase.dll => 166
	i64 u0x755a91767330b3d4, ; 493: lib_Microsoft.Extensions.Configuration.dll.so => 182
	i64 u0x75c326eb821b85c4, ; 494: lib_System.ComponentModel.DataAnnotations.dll.so => 14
	i64 u0x76012e7334db86e5, ; 495: lib_Xamarin.AndroidX.SavedState.dll.so => 274
	i64 u0x76ca07b878f44da0, ; 496: System.Runtime.Numerics.dll => 111
	i64 u0x7736c8a96e51a061, ; 497: lib_Xamarin.AndroidX.Annotation.Jvm.dll.so => 221
	i64 u0x778a805e625329ef, ; 498: System.Linq.Parallel => 60
	i64 u0x779290cc2b801eb7, ; 499: Xamarin.KotlinX.AtomicFU.Jvm => 298
	i64 u0x77f8a4acc2fdc449, ; 500: System.Security.Cryptography.Cng.dll => 121
	i64 u0x780bc73597a503a9, ; 501: lib-ms-Microsoft.Maui.Controls.resources.dll.so => 334
	i64 u0x782c5d8eb99ff201, ; 502: lib_Microsoft.VisualBasic.Core.dll.so => 2
	i64 u0x783606d1e53e7a1a, ; 503: th/Microsoft.Maui.Controls.resources.dll => 344
	i64 u0x78a45e51311409b6, ; 504: Xamarin.AndroidX.Fragment.dll => 246
	i64 u0x78ed4ab8f9d800a1, ; 505: Xamarin.AndroidX.Lifecycle.ViewModel => 260
	i64 u0x79eb916f2d11e1f0, ; 506: zh-Hans/Microsoft.Data.SqlClient.resources.dll => 315
	i64 u0x7a39601d6f0bb831, ; 507: lib_Xamarin.KotlinX.AtomicFU.dll.so => 297
	i64 u0x7a7e7eddf79c5d26, ; 508: lib_Xamarin.AndroidX.Lifecycle.ViewModel.dll.so => 260
	i64 u0x7a9a57d43b0845fa, ; 509: System.AppContext => 6
	i64 u0x7ad0f4f1e5d08183, ; 510: Xamarin.AndroidX.Collection.dll => 228
	i64 u0x7adb8da2ac89b647, ; 511: fi/Microsoft.Maui.Controls.resources.dll => 324
	i64 u0x7b13d9eaa944ade8, ; 512: Xamarin.AndroidX.DynamicAnimation.dll => 242
	i64 u0x7b4927e421291c41, ; 513: Microsoft.IdentityModel.JsonWebTokens.dll => 194
	i64 u0x7bef86a4335c4870, ; 514: System.ComponentModel.TypeConverter => 17
	i64 u0x7c0820144cd34d6a, ; 515: sk/Microsoft.Maui.Controls.resources.dll => 342
	i64 u0x7c2a0bd1e0f988fc, ; 516: lib-de-Microsoft.Maui.Controls.resources.dll.so => 321
	i64 u0x7c41d387501568ba, ; 517: System.Net.WebClient.dll => 77
	i64 u0x7c482cd79bd24b13, ; 518: lib_Xamarin.AndroidX.ConstraintLayout.dll.so => 232
	i64 u0x7cd2ec8eaf5241cd, ; 519: System.Security.dll => 131
	i64 u0x7cf9ae50dd350622, ; 520: Xamarin.Jetbrains.Annotations.dll => 294
	i64 u0x7d649b75d580bb42, ; 521: ms/Microsoft.Maui.Controls.resources.dll => 334
	i64 u0x7d8ee2bdc8e3aad1, ; 522: System.Numerics.Vectors => 83
	i64 u0x7df5df8db8eaa6ac, ; 523: Microsoft.Extensions.Logging.Debug => 188
	i64 u0x7dfc3d6d9d8d7b70, ; 524: System.Collections => 12
	i64 u0x7e2e564fa2f76c65, ; 525: lib_System.Diagnostics.Tracing.dll.so => 34
	i64 u0x7e302e110e1e1346, ; 526: lib_System.Security.Claims.dll.so => 119
	i64 u0x7e4465b3f78ad8d0, ; 527: Xamarin.KotlinX.Serialization.Core.dll => 302
	i64 u0x7e571cad5915e6c3, ; 528: lib_Xamarin.AndroidX.Lifecycle.Process.dll.so => 255
	i64 u0x7e6b1ca712437d7d, ; 529: Xamarin.AndroidX.Emoji2.ViewsHelper => 244
	i64 u0x7e946809d6008ef2, ; 530: lib_System.ObjectModel.dll.so => 85
	i64 u0x7ea0272c1b4a9635, ; 531: lib_Xamarin.Android.Glide.dll.so => 213
	i64 u0x7ecc13347c8fd849, ; 532: lib_System.ComponentModel.dll.so => 18
	i64 u0x7f00ddd9b9ca5a13, ; 533: Xamarin.AndroidX.ViewPager.dll => 285
	i64 u0x7f9351cd44b1273f, ; 534: Microsoft.Extensions.Configuration.Abstractions => 183
	i64 u0x7fae0ef4dc4770fe, ; 535: Microsoft.Identity.Client => 191
	i64 u0x7fbd557c99b3ce6f, ; 536: lib_Xamarin.AndroidX.Lifecycle.LiveData.Core.dll.so => 253
	i64 u0x8076a9a44a2ca331, ; 537: System.Net.Quic => 72
	i64 u0x80da183a87731838, ; 538: System.Reflection.Metadata => 95
	i64 u0x812c069d5cdecc17, ; 539: System.dll => 165
	i64 u0x81381be520a60adb, ; 540: Xamarin.AndroidX.Interpolator.dll => 248
	i64 u0x81657cec2b31e8aa, ; 541: System.Net => 82
	i64 u0x81ab745f6c0f5ce6, ; 542: zh-Hant/Microsoft.Maui.Controls.resources => 350
	i64 u0x8277f2be6b5ce05f, ; 543: Xamarin.AndroidX.AppCompat => 222
	i64 u0x828f06563b30bc50, ; 544: lib_Xamarin.AndroidX.CardView.dll.so => 227
	i64 u0x82920a8d9194a019, ; 545: Xamarin.KotlinX.AtomicFU.Jvm.dll => 298
	i64 u0x82b399cb01b531c4, ; 546: lib_System.Web.dll.so => 154
	i64 u0x82df8f5532a10c59, ; 547: lib_System.Drawing.dll.so => 36
	i64 u0x82f0b6e911d13535, ; 548: lib_System.Transactions.dll.so => 151
	i64 u0x82f6403342e12049, ; 549: uk/Microsoft.Maui.Controls.resources => 346
	i64 u0x83a7afd2c49adc86, ; 550: lib_Microsoft.IdentityModel.Abstractions.dll.so => 193
	i64 u0x83c14ba66c8e2b8c, ; 551: zh-Hans/Microsoft.Maui.Controls.resources => 349
	i64 u0x846ce984efea52c7, ; 552: System.Threading.Tasks.Parallel.dll => 144
	i64 u0x84ae73148a4557d2, ; 553: lib_System.IO.Pipes.dll.so => 56
	i64 u0x84b01102c12a9232, ; 554: System.Runtime.Serialization.Json.dll => 113
	i64 u0x850c5ba0b57ce8e7, ; 555: lib_Xamarin.AndroidX.Collection.dll.so => 228
	i64 u0x851d02edd334b044, ; 556: Xamarin.AndroidX.VectorDrawable => 282
	i64 u0x8528b82bdbc15371, ; 557: ko/Microsoft.Data.SqlClient.resources => 310
	i64 u0x85c919db62150978, ; 558: Xamarin.AndroidX.Transition.dll => 281
	i64 u0x8662aaeb94fef37f, ; 559: lib_System.Dynamic.Runtime.dll.so => 37
	i64 u0x86a909228dc7657b, ; 560: lib-zh-Hant-Microsoft.Maui.Controls.resources.dll.so => 350
	i64 u0x86b3e00c36b84509, ; 561: Microsoft.Extensions.Configuration.dll => 182
	i64 u0x86b62cb077ec4fd7, ; 562: System.Runtime.Serialization.Xml => 115
	i64 u0x8706ffb12bf3f53d, ; 563: Xamarin.AndroidX.Annotation.Experimental => 220
	i64 u0x872a5b14c18d328c, ; 564: System.ComponentModel.DataAnnotations => 14
	i64 u0x872fb9615bc2dff0, ; 565: Xamarin.Android.Glide.Annotations.dll => 214
	i64 u0x87c69b87d9283884, ; 566: lib_System.Threading.Thread.dll.so => 146
	i64 u0x87f6569b25707834, ; 567: System.IO.Compression.Brotli.dll => 43
	i64 u0x8842b3a5d2d3fb36, ; 568: Microsoft.Maui.Essentials => 202
	i64 u0x88926583efe7ee86, ; 569: Xamarin.AndroidX.Activity.Ktx.dll => 218
	i64 u0x88ba6bc4f7762b03, ; 570: lib_System.Reflection.dll.so => 98
	i64 u0x88bda98e0cffb7a9, ; 571: lib_Xamarin.KotlinX.Coroutines.Core.Jvm.dll.so => 301
	i64 u0x8930322c7bd8f768, ; 572: netstandard => 168
	i64 u0x897a606c9e39c75f, ; 573: lib_System.ComponentModel.Primitives.dll.so => 16
	i64 u0x89911a22005b92b7, ; 574: System.IO.FileSystem.DriveInfo.dll => 48
	i64 u0x89c5188089ec2cd5, ; 575: lib_System.Runtime.InteropServices.RuntimeInformation.dll.so => 107
	i64 u0x8a19e3dc71b34b2c, ; 576: System.Reflection.TypeExtensions.dll => 97
	i64 u0x8a399a706fcbce4b, ; 577: Microsoft.Extensions.Caching.Abstractions => 180
	i64 u0x8ad229ea26432ee2, ; 578: Xamarin.AndroidX.Loader => 264
	i64 u0x8b4ff5d0fdd5faa1, ; 579: lib_System.Diagnostics.DiagnosticSource.dll.so => 27
	i64 u0x8b541d476eb3774c, ; 580: System.Security.Principal.Windows => 128
	i64 u0x8b8d01333a96d0b5, ; 581: System.Diagnostics.Process.dll => 29
	i64 u0x8b9ceca7acae3451, ; 582: lib-he-Microsoft.Maui.Controls.resources.dll.so => 326
	i64 u0x8c156fe7f184f137, ; 583: tr/Microsoft.Data.SqlClient.resources => 314
	i64 u0x8c53ae18581b14f0, ; 584: Azure.Core => 174
	i64 u0x8cb8f612b633affb, ; 585: Xamarin.AndroidX.SavedState.SavedState.Ktx.dll => 275
	i64 u0x8cdfdb4ce85fb925, ; 586: lib_System.Security.Principal.Windows.dll.so => 128
	i64 u0x8cdfe7b8f4caa426, ; 587: System.IO.Compression.FileSystem => 44
	i64 u0x8d0f420977c2c1c7, ; 588: Xamarin.AndroidX.CursorAdapter.dll => 237
	i64 u0x8d52f7ea2796c531, ; 589: Xamarin.AndroidX.Emoji2.dll => 243
	i64 u0x8d7b8ab4b3310ead, ; 590: System.Threading => 149
	i64 u0x8da188285aadfe8e, ; 591: System.Collections.Concurrent => 8
	i64 u0x8e937db395a74375, ; 592: lib_Microsoft.Identity.Client.dll.so => 191
	i64 u0x8ed3cdd722b4d782, ; 593: System.Diagnostics.EventLog => 208
	i64 u0x8ed807bfe9858dfc, ; 594: Xamarin.AndroidX.Navigation.Common => 266
	i64 u0x8ee08b8194a30f48, ; 595: lib-hi-Microsoft.Maui.Controls.resources.dll.so => 327
	i64 u0x8ef7601039857a44, ; 596: lib-ro-Microsoft.Maui.Controls.resources.dll.so => 340
	i64 u0x8f32c6f611f6ffab, ; 597: pt/Microsoft.Maui.Controls.resources.dll => 339
	i64 u0x8f44b45eb046bbd1, ; 598: System.ServiceModel.Web.dll => 132
	i64 u0x8f8829d21c8985a4, ; 599: lib-pt-BR-Microsoft.Maui.Controls.resources.dll.so => 338
	i64 u0x8fbf5b0114c6dcef, ; 600: System.Globalization.dll => 42
	i64 u0x8fcc8c2a81f3d9e7, ; 601: Xamarin.KotlinX.Serialization.Core => 302
	i64 u0x90263f8448b8f572, ; 602: lib_System.Diagnostics.TraceSource.dll.so => 33
	i64 u0x903101b46fb73a04, ; 603: _Microsoft.Android.Resource.Designer => 351
	i64 u0x90393bd4865292f3, ; 604: lib_System.IO.Compression.dll.so => 46
	i64 u0x905e2b8e7ae91ae6, ; 605: System.Threading.Tasks.Extensions.dll => 143
	i64 u0x90634f86c5ebe2b5, ; 606: Xamarin.AndroidX.Lifecycle.ViewModel.Android => 261
	i64 u0x907b636704ad79ef, ; 607: lib_Microsoft.Maui.Controls.Xaml.dll.so => 200
	i64 u0x90e9efbfd68593e0, ; 608: lib_Xamarin.AndroidX.Lifecycle.LiveData.dll.so => 252
	i64 u0x91418dc638b29e68, ; 609: lib_Xamarin.AndroidX.CustomView.dll.so => 238
	i64 u0x9157bd523cd7ed36, ; 610: lib_System.Text.Json.dll.so => 138
	i64 u0x91a74f07b30d37e2, ; 611: System.Linq.dll => 62
	i64 u0x91cb86ea3b17111d, ; 612: System.ServiceModel.Web => 132
	i64 u0x91fa41a87223399f, ; 613: ca/Microsoft.Maui.Controls.resources.dll => 318
	i64 u0x92054e486c0c7ea7, ; 614: System.IO.FileSystem.DriveInfo => 48
	i64 u0x928614058c40c4cd, ; 615: lib_System.Xml.XPath.XDocument.dll.so => 160
	i64 u0x92b138fffca2b01e, ; 616: lib_Xamarin.AndroidX.Arch.Core.Runtime.dll.so => 225
	i64 u0x92dfc2bfc6c6a888, ; 617: Xamarin.AndroidX.Lifecycle.LiveData => 252
	i64 u0x933da2c779423d68, ; 618: Xamarin.Android.Glide.Annotations => 214
	i64 u0x93489853b6098685, ; 619: es/Microsoft.Data.SqlClient.resources.dll => 306
	i64 u0x9388aad9b7ae40ce, ; 620: lib_Xamarin.AndroidX.Lifecycle.Common.dll.so => 250
	i64 u0x93cfa73ab28d6e35, ; 621: ms/Microsoft.Maui.Controls.resources => 334
	i64 u0x941c00d21e5c0679, ; 622: lib_Xamarin.AndroidX.Transition.dll.so => 281
	i64 u0x944077d8ca3c6580, ; 623: System.IO.Compression.dll => 46
	i64 u0x948cffedc8ed7960, ; 624: System.Xml => 164
	i64 u0x948d746a7702861f, ; 625: Microsoft.IdentityModel.Logging.dll => 195
	i64 u0x94c8990839c4bdb1, ; 626: lib_Xamarin.AndroidX.Interpolator.dll.so => 248
	i64 u0x9502fd818eed2359, ; 627: lib_Microsoft.IdentityModel.Protocols.OpenIdConnect.dll.so => 197
	i64 u0x9564283c37ed59a9, ; 628: lib_Microsoft.IdentityModel.Logging.dll.so => 195
	i64 u0x965d480cfb8de46d, ; 629: pl/Microsoft.Data.SqlClient.resources.dll => 311
	i64 u0x967fc325e09bfa8c, ; 630: es/Microsoft.Maui.Controls.resources => 323
	i64 u0x9686161486d34b81, ; 631: lib_Xamarin.AndroidX.ExifInterface.dll.so => 245
	i64 u0x96e49b31fe33d427, ; 632: Microsoft.Identity.Client.Extensions.Msal => 192
	i64 u0x9732d8dbddea3d9a, ; 633: id/Microsoft.Maui.Controls.resources => 330
	i64 u0x978be80e5210d31b, ; 634: Microsoft.Maui.Graphics.dll => 203
	i64 u0x97b8c771ea3e4220, ; 635: System.ComponentModel.dll => 18
	i64 u0x97e144c9d3c6976e, ; 636: System.Collections.Concurrent.dll => 8
	i64 u0x984184e3c70d4419, ; 637: GoogleGson => 176
	i64 u0x9843944103683dd3, ; 638: Xamarin.AndroidX.Core.Core.Ktx => 236
	i64 u0x98d720cc4597562c, ; 639: System.Security.Cryptography.OpenSsl => 124
	i64 u0x991d510397f92d9d, ; 640: System.Linq.Expressions => 59
	i64 u0x996ceeb8a3da3d67, ; 641: System.Threading.Overlapped.dll => 141
	i64 u0x99a00ca5270c6878, ; 642: Xamarin.AndroidX.Navigation.Runtime => 268
	i64 u0x99cdc6d1f2d3a72f, ; 643: ko/Microsoft.Maui.Controls.resources.dll => 333
	i64 u0x9a01b1da98b6ee10, ; 644: Xamarin.AndroidX.Lifecycle.Runtime.dll => 256
	i64 u0x9a0cc42c6f36dfc9, ; 645: lib_Microsoft.IdentityModel.Protocols.dll.so => 196
	i64 u0x9a5ccc274fd6e6ee, ; 646: Jsr305Binding.dll => 290
	i64 u0x9ae6940b11c02876, ; 647: lib_Xamarin.AndroidX.Window.dll.so => 287
	i64 u0x9b211a749105beac, ; 648: System.Transactions.Local => 150
	i64 u0x9b8734714671022d, ; 649: System.Threading.Tasks.Dataflow.dll => 142
	i64 u0x9bc6aea27fbf034f, ; 650: lib_Xamarin.KotlinX.Coroutines.Core.dll.so => 300
	i64 u0x9bd8cc74558ad4c7, ; 651: Xamarin.KotlinX.AtomicFU => 297
	i64 u0x9c244ac7cda32d26, ; 652: System.Security.Cryptography.X509Certificates.dll => 126
	i64 u0x9c465f280cf43733, ; 653: lib_Xamarin.KotlinX.Coroutines.Android.dll.so => 299
	i64 u0x9c8f6872beab6408, ; 654: System.Xml.XPath.XDocument.dll => 160
	i64 u0x9ce01cf91101ae23, ; 655: System.Xml.XmlDocument => 162
	i64 u0x9d128180c81d7ce6, ; 656: Xamarin.AndroidX.CustomView.PoolingContainer => 239
	i64 u0x9d5dbcf5a48583fe, ; 657: lib_Xamarin.AndroidX.Activity.dll.so => 217
	i64 u0x9d74dee1a7725f34, ; 658: Microsoft.Extensions.Configuration.Abstractions.dll => 183
	i64 u0x9e4534b6adaf6e84, ; 659: nl/Microsoft.Maui.Controls.resources => 336
	i64 u0x9e4b95dec42769f7, ; 660: System.Diagnostics.Debug.dll => 26
	i64 u0x9eaf1efdf6f7267e, ; 661: Xamarin.AndroidX.Navigation.Common.dll => 266
	i64 u0x9ef542cf1f78c506, ; 662: Xamarin.AndroidX.Lifecycle.LiveData.Core => 253
	i64 u0x9ffbb6b1434ad2df, ; 663: Microsoft.Identity.Client.dll => 191
	i64 u0xa00832eb975f56a8, ; 664: lib_System.Net.dll.so => 82
	i64 u0xa0ad78236b7b267f, ; 665: Xamarin.AndroidX.Window => 287
	i64 u0xa0d8259f4cc284ec, ; 666: lib_System.Security.Cryptography.dll.so => 127
	i64 u0xa0e17ca50c77a225, ; 667: lib_Xamarin.Google.Crypto.Tink.Android.dll.so => 291
	i64 u0xa0ff9b3e34d92f11, ; 668: lib_System.Resources.Writer.dll.so => 101
	i64 u0xa12fbfb4da97d9f3, ; 669: System.Threading.Timer.dll => 148
	i64 u0xa1440773ee9d341e, ; 670: Xamarin.Google.Android.Material => 289
	i64 u0xa1b9d7c27f47219f, ; 671: Xamarin.AndroidX.Navigation.UI.dll => 269
	i64 u0xa2572680829d2c7c, ; 672: System.IO.Pipelines.dll => 54
	i64 u0xa26597e57ee9c7f6, ; 673: System.Xml.XmlDocument.dll => 162
	i64 u0xa308401900e5bed3, ; 674: lib_mscorlib.dll.so => 167
	i64 u0xa395572e7da6c99d, ; 675: lib_System.Security.dll.so => 131
	i64 u0xa3c64c49e90a9987, ; 676: System.Security.Cryptography.Pkcs => 211
	i64 u0xa3e683f24b43af6f, ; 677: System.Dynamic.Runtime.dll => 37
	i64 u0xa4145becdee3dc4f, ; 678: Xamarin.AndroidX.VectorDrawable.Animated => 283
	i64 u0xa46aa1eaa214539b, ; 679: ko/Microsoft.Maui.Controls.resources => 333
	i64 u0xa4edc8f2ceae241a, ; 680: System.Data.Common.dll => 22
	i64 u0xa5494f40f128ce6a, ; 681: System.Runtime.Serialization.Formatters.dll => 112
	i64 u0xa54b74df83dce92b, ; 682: System.Reflection.DispatchProxy => 90
	i64 u0xa579ed010d7e5215, ; 683: Xamarin.AndroidX.DocumentFile => 240
	i64 u0xa5b7152421ed6d98, ; 684: lib_System.IO.FileSystem.Watcher.dll.so => 50
	i64 u0xa5c3844f17b822db, ; 685: lib_System.Linq.Parallel.dll.so => 60
	i64 u0xa5ce5c755bde8cb8, ; 686: lib_System.Security.Cryptography.Csp.dll.so => 122
	i64 u0xa5e599d1e0524750, ; 687: System.Numerics.Vectors.dll => 83
	i64 u0xa5f1ba49b85dd355, ; 688: System.Security.Cryptography.dll => 127
	i64 u0xa61975a5a37873ea, ; 689: lib_System.Xml.XmlSerializer.dll.so => 163
	i64 u0xa6593e21584384d2, ; 690: lib_Jsr305Binding.dll.so => 290
	i64 u0xa66cbee0130865f7, ; 691: lib_WindowsBase.dll.so => 166
	i64 u0xa67dbee13e1df9ca, ; 692: Xamarin.AndroidX.SavedState.dll => 274
	i64 u0xa684b098dd27b296, ; 693: lib_Xamarin.AndroidX.Security.SecurityCrypto.dll.so => 276
	i64 u0xa68a420042bb9b1f, ; 694: Xamarin.AndroidX.DrawerLayout.dll => 241
	i64 u0xa6d26156d1cacc7c, ; 695: Xamarin.Android.Glide.dll => 213
	i64 u0xa71fe7d6f6f93efd, ; 696: Microsoft.Data.SqlClient => 179
	i64 u0xa75386b5cb9595aa, ; 697: Xamarin.AndroidX.Lifecycle.Runtime.Android => 257
	i64 u0xa763fbb98df8d9fb, ; 698: lib_Microsoft.Win32.Primitives.dll.so => 4
	i64 u0xa78ce3745383236a, ; 699: Xamarin.AndroidX.Lifecycle.Common.Jvm => 251
	i64 u0xa7c31b56b4dc7b33, ; 700: hu/Microsoft.Maui.Controls.resources => 329
	i64 u0xa7eab29ed44b4e7a, ; 701: Mono.Android.Export => 170
	i64 u0xa8195217cbf017b7, ; 702: Microsoft.VisualBasic.Core => 2
	i64 u0xa859a95830f367ff, ; 703: lib_Xamarin.AndroidX.Lifecycle.ViewModel.Ktx.dll.so => 262
	i64 u0xa8b52f21e0dbe690, ; 704: System.Runtime.Serialization.dll => 116
	i64 u0xa8e6320dd07580ef, ; 705: lib_Microsoft.IdentityModel.JsonWebTokens.dll.so => 194
	i64 u0xa8ee4ed7de2efaee, ; 706: Xamarin.AndroidX.Annotation.dll => 219
	i64 u0xa95590e7c57438a4, ; 707: System.Configuration => 19
	i64 u0xaa2219c8e3449ff5, ; 708: Microsoft.Extensions.Logging.Abstractions => 187
	i64 u0xaa443ac34067eeef, ; 709: System.Private.Xml.dll => 89
	i64 u0xaa52de307ef5d1dd, ; 710: System.Net.Http => 65
	i64 u0xaa9a7b0214a5cc5c, ; 711: System.Diagnostics.StackTrace.dll => 30
	i64 u0xaaaf86367285a918, ; 712: Microsoft.Extensions.DependencyInjection.Abstractions.dll => 185
	i64 u0xaaf84bb3f052a265, ; 713: el/Microsoft.Maui.Controls.resources => 322
	i64 u0xab9af77b5b67a0b8, ; 714: Xamarin.AndroidX.ConstraintLayout.Core => 233
	i64 u0xab9c1b2687d86b0b, ; 715: lib_System.Linq.Expressions.dll.so => 59
	i64 u0xac2af3fa195a15ce, ; 716: System.Runtime.Numerics => 111
	i64 u0xac5376a2a538dc10, ; 717: Xamarin.AndroidX.Lifecycle.LiveData.Core.dll => 253
	i64 u0xac5acae88f60357e, ; 718: System.Diagnostics.Tools.dll => 32
	i64 u0xac79c7e46047ad98, ; 719: System.Security.Principal.Windows.dll => 128
	i64 u0xac98d31068e24591, ; 720: System.Xml.XDocument => 159
	i64 u0xacd46e002c3ccb97, ; 721: ro/Microsoft.Maui.Controls.resources => 340
	i64 u0xacdd9e4180d56dda, ; 722: Xamarin.AndroidX.Concurrent.Futures => 231
	i64 u0xacf42eea7ef9cd12, ; 723: System.Threading.Channels => 140
	i64 u0xad7e82ed3b0f16d0, ; 724: lib_Xamarin.AndroidX.DocumentFile.dll.so => 240
	i64 u0xad89c07347f1bad6, ; 725: nl/Microsoft.Maui.Controls.resources.dll => 336
	i64 u0xadbb53caf78a79d2, ; 726: System.Web.HttpUtility => 153
	i64 u0xadc90ab061a9e6e4, ; 727: System.ComponentModel.TypeConverter.dll => 17
	i64 u0xadca1b9030b9317e, ; 728: Xamarin.AndroidX.Collection.Ktx => 230
	i64 u0xadd8eda2edf396ad, ; 729: Xamarin.Android.Glide.GifDecoder => 216
	i64 u0xadf4cf30debbeb9a, ; 730: System.Net.ServicePoint.dll => 75
	i64 u0xadf511667bef3595, ; 731: System.Net.Security => 74
	i64 u0xae0aaa94fdcfce0f, ; 732: System.ComponentModel.EventBasedAsync.dll => 15
	i64 u0xae282bcd03739de7, ; 733: Java.Interop => 169
	i64 u0xae53579c90db1107, ; 734: System.ObjectModel.dll => 85
	i64 u0xaec7c0c7e2ed4575, ; 735: lib_Xamarin.KotlinX.AtomicFU.Jvm.dll.so => 298
	i64 u0xaf732d0b2193b8f5, ; 736: System.Security.Cryptography.OpenSsl.dll => 124
	i64 u0xafdb94dbccd9d11c, ; 737: Xamarin.AndroidX.Lifecycle.LiveData.dll => 252
	i64 u0xafe29f45095518e7, ; 738: lib_Xamarin.AndroidX.Lifecycle.ViewModelSavedState.dll.so => 263
	i64 u0xb03ae931fb25607e, ; 739: Xamarin.AndroidX.ConstraintLayout => 232
	i64 u0xb05cc42cd94c6d9d, ; 740: lib-sv-Microsoft.Maui.Controls.resources.dll.so => 343
	i64 u0xb0ac21bec8f428c5, ; 741: Xamarin.AndroidX.Lifecycle.Runtime.Ktx.Android.dll => 259
	i64 u0xb0bb43dc52ea59f9, ; 742: System.Diagnostics.Tracing.dll => 34
	i64 u0xb1dd05401aa8ee63, ; 743: System.Security.AccessControl => 118
	i64 u0xb220631954820169, ; 744: System.Text.RegularExpressions => 139
	i64 u0xb2376e1dbf8b4ed7, ; 745: System.Security.Cryptography.Csp => 122
	i64 u0xb2a1959fe95c5402, ; 746: lib_System.Runtime.InteropServices.JavaScript.dll.so => 106
	i64 u0xb2a3f67f3bf29fce, ; 747: da/Microsoft.Maui.Controls.resources => 320
	i64 u0xb3874072ee0ecf8c, ; 748: Xamarin.AndroidX.VectorDrawable.Animated.dll => 283
	i64 u0xb398860d6ed7ba2f, ; 749: System.Security.Cryptography.ProtectedData => 212
	i64 u0xb3f0a0fcda8d3ebc, ; 750: Xamarin.AndroidX.CardView => 227
	i64 u0xb46be1aa6d4fff93, ; 751: hi/Microsoft.Maui.Controls.resources => 327
	i64 u0xb477491be13109d8, ; 752: ar/Microsoft.Maui.Controls.resources => 317
	i64 u0xb4bd7015ecee9d86, ; 753: System.IO.Pipelines => 54
	i64 u0xb4c53d9749c5f226, ; 754: lib_System.IO.FileSystem.AccessControl.dll.so => 47
	i64 u0xb4ff710863453fda, ; 755: System.Diagnostics.FileVersionInfo.dll => 28
	i64 u0xb5c38bf497a4cfe2, ; 756: lib_System.Threading.Tasks.dll.so => 145
	i64 u0xb5c7fcdafbc67ee4, ; 757: Microsoft.Extensions.Logging.Abstractions.dll => 187
	i64 u0xb5ea31d5244c6626, ; 758: System.Threading.ThreadPool.dll => 147
	i64 u0xb601b1e91b555eac, ; 759: MediQ.dll => 0
	i64 u0xb66575354464a3ec, ; 760: Xamarin.Kotlin.StdLib.Common => 296
	i64 u0xb7212c4683a94afe, ; 761: System.Drawing.Primitives => 35
	i64 u0xb7b7753d1f319409, ; 762: sv/Microsoft.Maui.Controls.resources => 343
	i64 u0xb81a2c6e0aee50fe, ; 763: lib_System.Private.CoreLib.dll.so => 173
	i64 u0xb8b0a9b3dfbc5cb7, ; 764: Xamarin.AndroidX.Window.Extensions.Core.Core => 288
	i64 u0xb8c60af47c08d4da, ; 765: System.Net.ServicePoint => 75
	i64 u0xb8e68d20aad91196, ; 766: lib_System.Xml.XPath.dll.so => 161
	i64 u0xb9185c33a1643eed, ; 767: Microsoft.CSharp.dll => 1
	i64 u0xb9b8001adf4ed7cc, ; 768: lib_Xamarin.AndroidX.SlidingPaneLayout.dll.so => 277
	i64 u0xb9f64d3b230def68, ; 769: lib-pt-Microsoft.Maui.Controls.resources.dll.so => 339
	i64 u0xb9fc3c8a556e3691, ; 770: ja/Microsoft.Maui.Controls.resources => 332
	i64 u0xba4670aa94a2b3c6, ; 771: lib_System.Xml.XDocument.dll.so => 159
	i64 u0xba48785529705af9, ; 772: System.Collections.dll => 12
	i64 u0xba965b8c86359996, ; 773: lib_System.Windows.dll.so => 155
	i64 u0xbb286883bc35db36, ; 774: System.Transactions.dll => 151
	i64 u0xbb65706fde942ce3, ; 775: System.Net.Sockets => 76
	i64 u0xbb8c8d165ef11460, ; 776: lib_Microsoft.Identity.Client.Extensions.Msal.dll.so => 192
	i64 u0xbba28979413cad9e, ; 777: lib_System.Runtime.CompilerServices.VisualC.dll.so => 103
	i64 u0xbbd180354b67271a, ; 778: System.Runtime.Serialization.Formatters => 112
	i64 u0xbc260cdba33291a3, ; 779: Xamarin.AndroidX.Arch.Core.Common.dll => 224
	i64 u0xbcd22b365b764643, ; 780: lib-zh-Hans-Microsoft.Data.SqlClient.resources.dll.so => 315
	i64 u0xbd0aaf9dbfcc3376, ; 781: fr/Microsoft.Data.SqlClient.resources.dll => 307
	i64 u0xbd0e2c0d55246576, ; 782: System.Net.Http.dll => 65
	i64 u0xbd3c2d7a8325e11b, ; 783: lib-fr-Microsoft.Data.SqlClient.resources.dll.so => 307
	i64 u0xbd3fbd85b9e1cb29, ; 784: lib_System.Net.HttpListener.dll.so => 66
	i64 u0xbd437a2cdb333d0d, ; 785: Xamarin.AndroidX.ViewPager2 => 286
	i64 u0xbd4aef17dbfb0390, ; 786: ru/Microsoft.Data.SqlClient.resources => 313
	i64 u0xbd4f572d2bd0a789, ; 787: System.IO.Compression.ZipFile.dll => 45
	i64 u0xbd5d0b88d3d647a5, ; 788: lib_Xamarin.AndroidX.Browser.dll.so => 226
	i64 u0xbd877b14d0b56392, ; 789: System.Runtime.Intrinsics.dll => 109
	i64 u0xbe65a49036345cf4, ; 790: lib_System.Buffers.dll.so => 7
	i64 u0xbee38d4a88835966, ; 791: Xamarin.AndroidX.AppCompat.AppCompatResources => 223
	i64 u0xbef9919db45b4ca7, ; 792: System.IO.Pipes.AccessControl => 55
	i64 u0xbf0fa68611139208, ; 793: lib_Xamarin.AndroidX.Annotation.dll.so => 219
	i64 u0xbfc1e1fb3095f2b3, ; 794: lib_System.Net.Http.Json.dll.so => 64
	i64 u0xc040a4ab55817f58, ; 795: ar/Microsoft.Maui.Controls.resources.dll => 317
	i64 u0xc07cadab29efeba0, ; 796: Xamarin.AndroidX.Core.Core.Ktx.dll => 236
	i64 u0xc0d928351ab5ca77, ; 797: System.Console.dll => 20
	i64 u0xc0f5a221a9383aea, ; 798: System.Runtime.Intrinsics => 109
	i64 u0xc111030af54d7191, ; 799: System.Resources.Writer => 101
	i64 u0xc12b8b3afa48329c, ; 800: lib_System.Linq.dll.so => 62
	i64 u0xc183ca0b74453aa9, ; 801: lib_System.Threading.Tasks.Dataflow.dll.so => 142
	i64 u0xc1ff9ae3cdb6e1e6, ; 802: Xamarin.AndroidX.Activity.dll => 217
	i64 u0xc26c064effb1dea9, ; 803: System.Buffers.dll => 7
	i64 u0xc278de356ad8a9e3, ; 804: Microsoft.IdentityModel.Logging => 195
	i64 u0xc28c50f32f81cc73, ; 805: ja/Microsoft.Maui.Controls.resources.dll => 332
	i64 u0xc2902f6cf5452577, ; 806: lib_Mono.Android.Export.dll.so => 170
	i64 u0xc2a3bca55b573141, ; 807: System.IO.FileSystem.Watcher => 50
	i64 u0xc2bcfec99f69365e, ; 808: Xamarin.AndroidX.ViewPager2.dll => 286
	i64 u0xc30b52815b58ac2c, ; 809: lib_System.Runtime.Serialization.Xml.dll.so => 115
	i64 u0xc36d7d89c652f455, ; 810: System.Threading.Overlapped => 141
	i64 u0xc396b285e59e5493, ; 811: GoogleGson.dll => 176
	i64 u0xc3c86c1e5e12f03d, ; 812: WindowsBase => 166
	i64 u0xc421b61fd853169d, ; 813: lib_System.Net.WebSockets.Client.dll.so => 80
	i64 u0xc463e077917aa21d, ; 814: System.Runtime.Serialization.Json => 113
	i64 u0xc4d3858ed4d08512, ; 815: Xamarin.AndroidX.Lifecycle.ViewModelSavedState.dll => 263
	i64 u0xc4d69851fe06342f, ; 816: lib_Microsoft.Extensions.Caching.Memory.dll.so => 181
	i64 u0xc50fded0ded1418c, ; 817: lib_System.ComponentModel.TypeConverter.dll.so => 17
	i64 u0xc519125d6bc8fb11, ; 818: lib_System.Net.Requests.dll.so => 73
	i64 u0xc5293b19e4dc230e, ; 819: Xamarin.AndroidX.Navigation.Fragment => 267
	i64 u0xc5325b2fcb37446f, ; 820: lib_System.Private.Xml.dll.so => 89
	i64 u0xc535cb9a21385d9b, ; 821: lib_Xamarin.Android.Glide.DiskLruCache.dll.so => 215
	i64 u0xc583d8477b5d3bac, ; 822: zh-Hant/Microsoft.Data.SqlClient.resources.dll => 316
	i64 u0xc5a0f4b95a699af7, ; 823: lib_System.Private.Uri.dll.so => 87
	i64 u0xc5cdcd5b6277579e, ; 824: lib_System.Security.Cryptography.Algorithms.dll.so => 120
	i64 u0xc5ec286825cb0bf4, ; 825: Xamarin.AndroidX.Tracing.Tracing => 280
	i64 u0xc6706bc8aa7fe265, ; 826: Xamarin.AndroidX.Annotation.Jvm => 221
	i64 u0xc7c01e7d7c93a110, ; 827: System.Text.Encoding.Extensions.dll => 135
	i64 u0xc7ce851898a4548e, ; 828: lib_System.Web.HttpUtility.dll.so => 153
	i64 u0xc809d4089d2556b2, ; 829: System.Runtime.InteropServices.JavaScript.dll => 106
	i64 u0xc858a28d9ee5a6c5, ; 830: lib_System.Collections.Specialized.dll.so => 11
	i64 u0xc8ac7c6bf1c2ec51, ; 831: System.Reflection.DispatchProxy.dll => 90
	i64 u0xc9c62c8f354ac568, ; 832: lib_System.Diagnostics.TextWriterTraceListener.dll.so => 31
	i64 u0xca32340d8d54dcd5, ; 833: Microsoft.Extensions.Caching.Memory.dll => 181
	i64 u0xca3a723e7342c5b6, ; 834: lib-tr-Microsoft.Maui.Controls.resources.dll.so => 345
	i64 u0xca5801070d9fccfb, ; 835: System.Text.Encoding => 136
	i64 u0xcab3493c70141c2d, ; 836: pl/Microsoft.Maui.Controls.resources => 337
	i64 u0xcacfddc9f7c6de76, ; 837: ro/Microsoft.Maui.Controls.resources.dll => 340
	i64 u0xcadbc92899a777f0, ; 838: Xamarin.AndroidX.Startup.StartupRuntime => 278
	i64 u0xcba1cb79f45292b5, ; 839: Xamarin.Android.Glide.GifDecoder.dll => 216
	i64 u0xcbb5f80c7293e696, ; 840: lib_System.Globalization.Calendars.dll.so => 40
	i64 u0xcbd4fdd9cef4a294, ; 841: lib__Microsoft.Android.Resource.Designer.dll.so => 351
	i64 u0xcc15da1e07bbd994, ; 842: Xamarin.AndroidX.SlidingPaneLayout => 277
	i64 u0xcc182c3afdc374d6, ; 843: Microsoft.Bcl.AsyncInterfaces => 177
	i64 u0xcc2876b32ef2794c, ; 844: lib_System.Text.RegularExpressions.dll.so => 139
	i64 u0xcc5c3bb714c4561e, ; 845: Xamarin.KotlinX.Coroutines.Core.Jvm.dll => 301
	i64 u0xcc76886e09b88260, ; 846: Xamarin.KotlinX.Serialization.Core.Jvm.dll => 303
	i64 u0xcc9fa2923aa1c9ef, ; 847: System.Diagnostics.Contracts.dll => 25
	i64 u0xccf25c4b634ccd3a, ; 848: zh-Hans/Microsoft.Maui.Controls.resources.dll => 349
	i64 u0xcd10a42808629144, ; 849: System.Net.Requests => 73
	i64 u0xcdca1b920e9f53ba, ; 850: Xamarin.AndroidX.Interpolator => 248
	i64 u0xcdd0c48b6937b21c, ; 851: Xamarin.AndroidX.SwipeRefreshLayout => 279
	i64 u0xceb28d385f84f441, ; 852: Azure.Core.dll => 174
	i64 u0xcf140ed700bc8e66, ; 853: Microsoft.SqlServer.Server.dll => 204
	i64 u0xcf23d8093f3ceadf, ; 854: System.Diagnostics.DiagnosticSource.dll => 27
	i64 u0xcf5ff6b6b2c4c382, ; 855: System.Net.Mail.dll => 67
	i64 u0xcf8fc898f98b0d34, ; 856: System.Private.Xml.Linq => 88
	i64 u0xd04b5f59ed596e31, ; 857: System.Reflection.Metadata.dll => 95
	i64 u0xd063299fcfc0c93f, ; 858: lib_System.Runtime.Serialization.Json.dll.so => 113
	i64 u0xd0de8a113e976700, ; 859: System.Diagnostics.TextWriterTraceListener => 31
	i64 u0xd0fc33d5ae5d4cb8, ; 860: System.Runtime.Extensions => 104
	i64 u0xd1194e1d8a8de83c, ; 861: lib_Xamarin.AndroidX.Lifecycle.Common.Jvm.dll.so => 251
	i64 u0xd12beacdfc14f696, ; 862: System.Dynamic.Runtime => 37
	i64 u0xd198e7ce1b6a8344, ; 863: System.Net.Quic.dll => 72
	i64 u0xd22a0c4630f2fe66, ; 864: lib_System.Security.Cryptography.ProtectedData.dll.so => 212
	i64 u0xd2dffb59201927bd, ; 865: de/Microsoft.Data.SqlClient.resources.dll => 305
	i64 u0xd3144156a3727ebe, ; 866: Xamarin.Google.Guava.ListenableFuture => 293
	i64 u0xd333d0af9e423810, ; 867: System.Runtime.InteropServices => 108
	i64 u0xd33a415cb4278969, ; 868: System.Security.Cryptography.Encoding.dll => 123
	i64 u0xd3426d966bb704f5, ; 869: Xamarin.AndroidX.AppCompat.AppCompatResources.dll => 223
	i64 u0xd3651b6fc3125825, ; 870: System.Private.Uri.dll => 87
	i64 u0xd373685349b1fe8b, ; 871: Microsoft.Extensions.Logging.dll => 186
	i64 u0xd3801faafafb7698, ; 872: System.Private.DataContractSerialization.dll => 86
	i64 u0xd3e4c8d6a2d5d470, ; 873: it/Microsoft.Maui.Controls.resources => 331
	i64 u0xd3edcc1f25459a50, ; 874: System.Reflection.Emit => 93
	i64 u0xd4645626dffec99d, ; 875: lib_Microsoft.Extensions.DependencyInjection.Abstractions.dll.so => 185
	i64 u0xd4fa0abb79079ea9, ; 876: System.Security.Principal.dll => 129
	i64 u0xd5507e11a2b2839f, ; 877: Xamarin.AndroidX.Lifecycle.ViewModelSavedState => 263
	i64 u0xd5858610826f1c08, ; 878: lib-ru-Microsoft.Data.SqlClient.resources.dll.so => 313
	i64 u0xd5d04bef8478ea19, ; 879: Xamarin.AndroidX.Tracing.Tracing.dll => 280
	i64 u0xd60815f26a12e140, ; 880: Microsoft.Extensions.Logging.Debug.dll => 188
	i64 u0xd6694f8359737e4e, ; 881: Xamarin.AndroidX.SavedState => 274
	i64 u0xd6949e129339eae5, ; 882: lib_Xamarin.AndroidX.Core.Core.Ktx.dll.so => 236
	i64 u0xd6d21782156bc35b, ; 883: Xamarin.AndroidX.SwipeRefreshLayout.dll => 279
	i64 u0xd6de019f6af72435, ; 884: Xamarin.AndroidX.ConstraintLayout.Core.dll => 233
	i64 u0xd70956d1e6deefb9, ; 885: Jsr305Binding => 290
	i64 u0xd72329819cbbbc44, ; 886: lib_Microsoft.Extensions.Configuration.Abstractions.dll.so => 183
	i64 u0xd72c760af136e863, ; 887: System.Xml.XmlSerializer.dll => 163
	i64 u0xd753f071e44c2a03, ; 888: lib_System.Security.SecureString.dll.so => 130
	i64 u0xd7b3764ada9d341d, ; 889: lib_Microsoft.Extensions.Logging.Abstractions.dll.so => 187
	i64 u0xd7f0088bc5ad71f2, ; 890: Xamarin.AndroidX.VersionedParcelable => 284
	i64 u0xd8fb25e28ae30a12, ; 891: Xamarin.AndroidX.ProfileInstaller.ProfileInstaller.dll => 271
	i64 u0xda1dfa4c534a9251, ; 892: Microsoft.Extensions.DependencyInjection => 184
	i64 u0xdad05a11827959a3, ; 893: System.Collections.NonGeneric.dll => 10
	i64 u0xdaefdfe71aa53cf9, ; 894: System.IO.FileSystem.Primitives => 49
	i64 u0xdb5383ab5865c007, ; 895: lib-vi-Microsoft.Maui.Controls.resources.dll.so => 347
	i64 u0xdb58816721c02a59, ; 896: lib_System.Reflection.Emit.ILGeneration.dll.so => 91
	i64 u0xdbeda89f832aa805, ; 897: vi/Microsoft.Maui.Controls.resources.dll => 347
	i64 u0xdbf2a779fbc3ac31, ; 898: System.Transactions.Local.dll => 150
	i64 u0xdbf9607a441b4505, ; 899: System.Linq => 62
	i64 u0xdbfc90157a0de9b0, ; 900: lib_System.Text.Encoding.dll.so => 136
	i64 u0xdc75032002d1a212, ; 901: lib_System.Transactions.Local.dll.so => 150
	i64 u0xdca8be7403f92d4f, ; 902: lib_System.Linq.Queryable.dll.so => 61
	i64 u0xdce2c53525640bf3, ; 903: Microsoft.Extensions.Logging => 186
	i64 u0xdd2b722d78ef5f43, ; 904: System.Runtime.dll => 117
	i64 u0xdd67031857c72f96, ; 905: lib_System.Text.Encodings.Web.dll.so => 137
	i64 u0xdd92e229ad292030, ; 906: System.Numerics.dll => 84
	i64 u0xdddcdd701e911af1, ; 907: lib_Xamarin.AndroidX.Legacy.Support.Core.Utils.dll.so => 249
	i64 u0xdde30e6b77aa6f6c, ; 908: lib-zh-Hans-Microsoft.Maui.Controls.resources.dll.so => 349
	i64 u0xde110ae80fa7c2e2, ; 909: System.Xml.XDocument.dll => 159
	i64 u0xde4726fcdf63a198, ; 910: Xamarin.AndroidX.Transition => 281
	i64 u0xde572c2b2fb32f93, ; 911: lib_System.Threading.Tasks.Extensions.dll.so => 143
	i64 u0xde8769ebda7d8647, ; 912: hr/Microsoft.Maui.Controls.resources.dll => 328
	i64 u0xdee075f3477ef6be, ; 913: Xamarin.AndroidX.ExifInterface.dll => 245
	i64 u0xdf4b773de8fb1540, ; 914: System.Net.dll => 82
	i64 u0xdfa254ebb4346068, ; 915: System.Net.Ping => 70
	i64 u0xe0142572c095a480, ; 916: Xamarin.AndroidX.AppCompat.dll => 222
	i64 u0xe021eaa401792a05, ; 917: System.Text.Encoding.dll => 136
	i64 u0xe02f89350ec78051, ; 918: Xamarin.AndroidX.CoordinatorLayout.dll => 234
	i64 u0xe0496b9d65ef5474, ; 919: Xamarin.Android.Glide.DiskLruCache.dll => 215
	i64 u0xe0ea30f1ac5b7731, ; 920: ko/Microsoft.Data.SqlClient.resources.dll => 310
	i64 u0xe0ee2e61123c1478, ; 921: lib-es-Microsoft.Data.SqlClient.resources.dll.so => 306
	i64 u0xe10b760bb1462e7a, ; 922: lib_System.Security.Cryptography.Primitives.dll.so => 125
	i64 u0xe12265280d0b036d, ; 923: fr/Microsoft.Data.SqlClient.resources => 307
	i64 u0xe192a588d4410686, ; 924: lib_System.IO.Pipelines.dll.so => 54
	i64 u0xe1a08bd3fa539e0d, ; 925: System.Runtime.Loader => 110
	i64 u0xe1a77eb8831f7741, ; 926: System.Security.SecureString.dll => 130
	i64 u0xe1b52f9f816c70ef, ; 927: System.Private.Xml.Linq.dll => 88
	i64 u0xe1e199c8ab02e356, ; 928: System.Data.DataSetExtensions.dll => 23
	i64 u0xe1ecfdb7fff86067, ; 929: System.Net.Security.dll => 74
	i64 u0xe2252a80fe853de4, ; 930: lib_System.Security.Principal.dll.so => 129
	i64 u0xe22fa4c9c645db62, ; 931: System.Diagnostics.TextWriterTraceListener.dll => 31
	i64 u0xe2420585aeceb728, ; 932: System.Net.Requests.dll => 73
	i64 u0xe26692647e6bcb62, ; 933: Xamarin.AndroidX.Lifecycle.Runtime.Ktx => 258
	i64 u0xe29b73bc11392966, ; 934: lib-id-Microsoft.Maui.Controls.resources.dll.so => 330
	i64 u0xe2ad448dee50fbdf, ; 935: System.Xml.Serialization => 158
	i64 u0xe2d920f978f5d85c, ; 936: System.Data.DataSetExtensions => 23
	i64 u0xe2e426c7714fa0bc, ; 937: Microsoft.Win32.Primitives.dll => 4
	i64 u0xe332bacb3eb4a806, ; 938: Mono.Android.Export.dll => 170
	i64 u0xe3811d68d4fe8463, ; 939: pt-BR/Microsoft.Maui.Controls.resources.dll => 338
	i64 u0xe3b7cbae5ad66c75, ; 940: lib_System.Security.Cryptography.Encoding.dll.so => 123
	i64 u0xe494f7ced4ecd10a, ; 941: hu/Microsoft.Maui.Controls.resources.dll => 329
	i64 u0xe4a9b1e40d1e8917, ; 942: lib-fi-Microsoft.Maui.Controls.resources.dll.so => 324
	i64 u0xe4f74a0b5bf9703f, ; 943: System.Runtime.Serialization.Primitives => 114
	i64 u0xe5434e8a119ceb69, ; 944: lib_Mono.Android.dll.so => 172
	i64 u0xe55703b9ce5c038a, ; 945: System.Diagnostics.Tools => 32
	i64 u0xe57013c8afc270b5, ; 946: Microsoft.VisualBasic => 3
	i64 u0xe57d22ca4aeb4900, ; 947: System.Configuration.ConfigurationManager => 206
	i64 u0xe62913cc36bc07ec, ; 948: System.Xml.dll => 164
	i64 u0xe7bea09c4900a191, ; 949: Xamarin.AndroidX.VectorDrawable.dll => 282
	i64 u0xe7e03cc18dcdeb49, ; 950: lib_System.Diagnostics.StackTrace.dll.so => 30
	i64 u0xe7e147ff99a7a380, ; 951: lib_System.Configuration.dll.so => 19
	i64 u0xe86b0df4ba9e5db8, ; 952: lib_Xamarin.AndroidX.Lifecycle.Runtime.Android.dll.so => 257
	i64 u0xe896622fe0902957, ; 953: System.Reflection.Emit.dll => 93
	i64 u0xe89a2a9ef110899b, ; 954: System.Drawing.dll => 36
	i64 u0xe8c5f8c100b5934b, ; 955: Microsoft.Win32.Registry => 5
	i64 u0xe957c3976986ab72, ; 956: lib_Xamarin.AndroidX.Window.Extensions.Core.Core.dll.so => 288
	i64 u0xe98163eb702ae5c5, ; 957: Xamarin.AndroidX.Arch.Core.Runtime => 225
	i64 u0xe994f23ba4c143e5, ; 958: Xamarin.KotlinX.Coroutines.Android => 299
	i64 u0xe9b9c8c0458fd92a, ; 959: System.Windows => 155
	i64 u0xe9d166d87a7f2bdb, ; 960: lib_Xamarin.AndroidX.Startup.StartupRuntime.dll.so => 278
	i64 u0xea5a4efc2ad81d1b, ; 961: Xamarin.Google.ErrorProne.Annotations => 292
	i64 u0xeb2313fe9d65b785, ; 962: Xamarin.AndroidX.ConstraintLayout.dll => 232
	i64 u0xeb6e275e78cb8d42, ; 963: Xamarin.AndroidX.LocalBroadcastManager.dll => 265
	i64 u0xed19c616b3fcb7eb, ; 964: Xamarin.AndroidX.VersionedParcelable.dll => 284
	i64 u0xed6ef763c6fb395f, ; 965: System.Diagnostics.EventLog.dll => 208
	i64 u0xedc4817167106c23, ; 966: System.Net.Sockets.dll => 76
	i64 u0xedc632067fb20ff3, ; 967: System.Memory.dll => 63
	i64 u0xedc8e4ca71a02a8b, ; 968: Xamarin.AndroidX.Navigation.Runtime.dll => 268
	i64 u0xee81f5b3f1c4f83b, ; 969: System.Threading.ThreadPool => 147
	i64 u0xeeb7ebb80150501b, ; 970: lib_Xamarin.AndroidX.Collection.Jvm.dll.so => 229
	i64 u0xeefc635595ef57f0, ; 971: System.Security.Cryptography.Cng => 121
	i64 u0xef03b1b5a04e9709, ; 972: System.Text.Encoding.CodePages.dll => 134
	i64 u0xef432781d5667f61, ; 973: Xamarin.AndroidX.Print => 270
	i64 u0xef602c523fe2e87a, ; 974: lib_Xamarin.Google.Guava.ListenableFuture.dll.so => 293
	i64 u0xef72742e1bcca27a, ; 975: Microsoft.Maui.Essentials.dll => 202
	i64 u0xefd0396433f04886, ; 976: pt-BR/Microsoft.Data.SqlClient.resources => 312
	i64 u0xefd1e0c4e5c9b371, ; 977: System.Resources.ResourceManager.dll => 100
	i64 u0xefe8f8d5ed3c72ea, ; 978: System.Formats.Tar.dll => 39
	i64 u0xefec0b7fdc57ec42, ; 979: Xamarin.AndroidX.Activity => 217
	i64 u0xf00c29406ea45e19, ; 980: es/Microsoft.Maui.Controls.resources.dll => 323
	i64 u0xf09e47b6ae914f6e, ; 981: System.Net.NameResolution => 68
	i64 u0xf0ac2b489fed2e35, ; 982: lib_System.Diagnostics.Debug.dll.so => 26
	i64 u0xf0bb49dadd3a1fe1, ; 983: lib_System.Net.ServicePoint.dll.so => 75
	i64 u0xf0de2537ee19c6ca, ; 984: lib_System.Net.WebHeaderCollection.dll.so => 78
	i64 u0xf1138779fa181c68, ; 985: lib_Xamarin.AndroidX.Lifecycle.Runtime.dll.so => 256
	i64 u0xf11b621fc87b983f, ; 986: Microsoft.Maui.Controls.Xaml.dll => 200
	i64 u0xf161f4f3c3b7e62c, ; 987: System.Data => 24
	i64 u0xf16eb650d5a464bc, ; 988: System.ValueTuple => 152
	i64 u0xf1c4b4005493d871, ; 989: System.Formats.Asn1.dll => 38
	i64 u0xf238bd79489d3a96, ; 990: lib-nl-Microsoft.Maui.Controls.resources.dll.so => 336
	i64 u0xf2feea356ba760af, ; 991: Xamarin.AndroidX.Arch.Core.Runtime.dll => 225
	i64 u0xf300e085f8acd238, ; 992: lib_System.ServiceProcess.dll.so => 133
	i64 u0xf34e52b26e7e059d, ; 993: System.Runtime.CompilerServices.VisualC.dll => 103
	i64 u0xf37221fda4ef8830, ; 994: lib_Xamarin.Google.Android.Material.dll.so => 289
	i64 u0xf3ad9b8fb3eefd12, ; 995: lib_System.IO.UnmanagedMemoryStream.dll.so => 57
	i64 u0xf3ddfe05336abf29, ; 996: System => 165
	i64 u0xf408654b2a135055, ; 997: System.Reflection.Emit.ILGeneration.dll => 91
	i64 u0xf4103170a1de5bd0, ; 998: System.Linq.Queryable.dll => 61
	i64 u0xf42d20c23173d77c, ; 999: lib_System.ServiceModel.Web.dll.so => 132
	i64 u0xf4c1dd70a5496a17, ; 1000: System.IO.Compression => 46
	i64 u0xf4ecf4b9afc64781, ; 1001: System.ServiceProcess.dll => 133
	i64 u0xf4eeeaa566e9b970, ; 1002: lib_Xamarin.AndroidX.CustomView.PoolingContainer.dll.so => 239
	i64 u0xf518f63ead11fcd1, ; 1003: System.Threading.Tasks => 145
	i64 u0xf5e59d7ac34b50aa, ; 1004: Microsoft.IdentityModel.Protocols.dll => 196
	i64 u0xf5fc7602fe27b333, ; 1005: System.Net.WebHeaderCollection => 78
	i64 u0xf6077741019d7428, ; 1006: Xamarin.AndroidX.CoordinatorLayout => 234
	i64 u0xf61ade9836ad4692, ; 1007: Microsoft.IdentityModel.Tokens.dll => 198
	i64 u0xf6742cbf457c450b, ; 1008: Xamarin.AndroidX.Lifecycle.Runtime.Android.dll => 257
	i64 u0xf6c0e7d55a7a4e4f, ; 1009: Microsoft.IdentityModel.JsonWebTokens => 194
	i64 u0xf70c0a7bf8ccf5af, ; 1010: System.Web => 154
	i64 u0xf77b20923f07c667, ; 1011: de/Microsoft.Maui.Controls.resources.dll => 321
	i64 u0xf7be8a85d06b4b64, ; 1012: ru/Microsoft.Data.SqlClient.resources.dll => 313
	i64 u0xf7e2cac4c45067b3, ; 1013: lib_System.Numerics.Vectors.dll.so => 83
	i64 u0xf7e74930e0e3d214, ; 1014: zh-HK/Microsoft.Maui.Controls.resources.dll => 348
	i64 u0xf83775f330791063, ; 1015: ja/Microsoft.Data.SqlClient.resources.dll => 309
	i64 u0xf84773b5c81e3cef, ; 1016: lib-uk-Microsoft.Maui.Controls.resources.dll.so => 346
	i64 u0xf8aac5ea82de1348, ; 1017: System.Linq.Queryable => 61
	i64 u0xf8b77539b362d3ba, ; 1018: lib_System.Reflection.Primitives.dll.so => 96
	i64 u0xf8cd217ba1bbfdc8, ; 1019: lib-zh-Hant-Microsoft.Data.SqlClient.resources.dll.so => 316
	i64 u0xf8e045dc345b2ea3, ; 1020: lib_Xamarin.AndroidX.RecyclerView.dll.so => 272
	i64 u0xf915dc29808193a1, ; 1021: System.Web.HttpUtility.dll => 153
	i64 u0xf96c777a2a0686f4, ; 1022: hi/Microsoft.Maui.Controls.resources.dll => 327
	i64 u0xf9be54c8bcf8ff3b, ; 1023: System.Security.AccessControl.dll => 118
	i64 u0xf9eec5bb3a6aedc6, ; 1024: Microsoft.Extensions.Options => 189
	i64 u0xfa0e82300e67f913, ; 1025: lib_System.AppContext.dll.so => 6
	i64 u0xfa2fdb27e8a2c8e8, ; 1026: System.ComponentModel.EventBasedAsync => 15
	i64 u0xfa3f278f288b0e84, ; 1027: lib_System.Net.Security.dll.so => 74
	i64 u0xfa5ed7226d978949, ; 1028: lib-ar-Microsoft.Maui.Controls.resources.dll.so => 317
	i64 u0xfa645d91e9fc4cba, ; 1029: System.Threading.Thread => 146
	i64 u0xfad4d2c770e827f9, ; 1030: lib_System.IO.IsolatedStorage.dll.so => 52
	i64 u0xfb06dd2338e6f7c4, ; 1031: System.Net.Ping.dll => 70
	i64 u0xfb087abe5365e3b7, ; 1032: lib_System.Data.DataSetExtensions.dll.so => 23
	i64 u0xfb846e949baff5ea, ; 1033: System.Xml.Serialization.dll => 158
	i64 u0xfbad3e4ce4b98145, ; 1034: System.Security.Cryptography.X509Certificates => 126
	i64 u0xfbf0a31c9fc34bc4, ; 1035: lib_System.Net.Http.dll.so => 65
	i64 u0xfc61ddcf78dd1f54, ; 1036: Xamarin.AndroidX.LocalBroadcastManager => 265
	i64 u0xfc6b7527cc280b3f, ; 1037: lib_System.Runtime.Serialization.Formatters.dll.so => 112
	i64 u0xfc719aec26adf9d9, ; 1038: Xamarin.AndroidX.Navigation.Fragment.dll => 267
	i64 u0xfc82690c2fe2735c, ; 1039: Xamarin.AndroidX.Lifecycle.Process.dll => 255
	i64 u0xfc93fc307d279893, ; 1040: System.IO.Pipes.AccessControl.dll => 55
	i64 u0xfcd302092ada6328, ; 1041: System.IO.MemoryMappedFiles.dll => 53
	i64 u0xfcd5b90cf101e36b, ; 1042: System.Data.SqlClient.dll => 207
	i64 u0xfd22f00870e40ae0, ; 1043: lib_Xamarin.AndroidX.DrawerLayout.dll.so => 241
	i64 u0xfd49b3c1a76e2748, ; 1044: System.Runtime.InteropServices.RuntimeInformation => 107
	i64 u0xfd536c702f64dc47, ; 1045: System.Text.Encoding.Extensions => 135
	i64 u0xfd583f7657b6a1cb, ; 1046: Xamarin.AndroidX.Fragment => 246
	i64 u0xfd8dd91a2c26bd5d, ; 1047: Xamarin.AndroidX.Lifecycle.Runtime => 256
	i64 u0xfda36abccf05cf5c, ; 1048: System.Net.WebSockets.Client => 80
	i64 u0xfddbe9695626a7f5, ; 1049: Xamarin.AndroidX.Lifecycle.Common => 250
	i64 u0xfeae9952cf03b8cb, ; 1050: tr/Microsoft.Maui.Controls.resources => 345
	i64 u0xfebe1950717515f9, ; 1051: Xamarin.AndroidX.Lifecycle.LiveData.Core.Ktx.dll => 254
	i64 u0xff270a55858bac8d, ; 1052: System.Security.Principal => 129
	i64 u0xff9b54613e0d2cc8, ; 1053: System.Net.Http.Json => 64
	i64 u0xffdb7a971be4ec73, ; 1054: System.ValueTuple.dll => 152
	i64 u0xfff40914e0b38d3d ; 1055: Azure.Identity.dll => 175
], align 8

@assembly_image_cache_indices = dso_local local_unnamed_addr constant [1056 x i32] [
	i32 42, i32 300, i32 305, i32 279, i32 13, i32 268, i32 211, i32 105,
	i32 310, i32 181, i32 171, i32 48, i32 222, i32 7, i32 86, i32 341,
	i32 319, i32 347, i32 193, i32 242, i32 296, i32 71, i32 272, i32 12,
	i32 201, i32 102, i32 316, i32 314, i32 348, i32 156, i32 19, i32 247,
	i32 229, i32 161, i32 244, i32 282, i32 167, i32 341, i32 10, i32 308,
	i32 188, i32 283, i32 174, i32 96, i32 239, i32 241, i32 13, i32 189,
	i32 10, i32 210, i32 127, i32 95, i32 180, i32 140, i32 179, i32 39,
	i32 342, i32 303, i32 285, i32 338, i32 172, i32 216, i32 5, i32 202,
	i32 67, i32 276, i32 130, i32 177, i32 275, i32 243, i32 68, i32 230,
	i32 66, i32 309, i32 57, i32 177, i32 238, i32 52, i32 306, i32 43,
	i32 125, i32 67, i32 81, i32 258, i32 158, i32 92, i32 99, i32 272,
	i32 197, i32 141, i32 151, i32 226, i32 325, i32 162, i32 169, i32 326,
	i32 197, i32 185, i32 81, i32 230, i32 4, i32 5, i32 208, i32 51,
	i32 101, i32 305, i32 56, i32 120, i32 98, i32 168, i32 118, i32 300,
	i32 21, i32 329, i32 137, i32 97, i32 303, i32 77, i32 335, i32 270,
	i32 278, i32 119, i32 175, i32 8, i32 165, i32 344, i32 70, i32 215,
	i32 259, i32 273, i32 171, i32 145, i32 40, i32 276, i32 47, i32 30,
	i32 269, i32 333, i32 144, i32 189, i32 163, i32 28, i32 84, i32 280,
	i32 77, i32 43, i32 29, i32 42, i32 103, i32 117, i32 220, i32 205,
	i32 45, i32 91, i32 344, i32 56, i32 148, i32 146, i32 100, i32 49,
	i32 304, i32 20, i32 235, i32 114, i32 213, i32 325, i32 291, i32 295,
	i32 190, i32 94, i32 58, i32 209, i32 330, i32 328, i32 81, i32 291,
	i32 169, i32 26, i32 71, i32 271, i32 245, i32 346, i32 69, i32 33,
	i32 324, i32 14, i32 139, i32 209, i32 38, i32 350, i32 231, i32 337,
	i32 134, i32 92, i32 88, i32 312, i32 149, i32 343, i32 24, i32 138,
	i32 57, i32 51, i32 322, i32 29, i32 157, i32 204, i32 34, i32 164,
	i32 180, i32 246, i32 193, i32 52, i32 351, i32 287, i32 90, i32 227,
	i32 35, i32 325, i32 157, i32 9, i32 323, i32 76, i32 204, i32 55,
	i32 201, i32 319, i32 199, i32 13, i32 286, i32 182, i32 224, i32 109,
	i32 262, i32 32, i32 104, i32 84, i32 92, i32 53, i32 96, i32 294,
	i32 58, i32 9, i32 102, i32 178, i32 238, i32 68, i32 196, i32 206,
	i32 285, i32 318, i32 125, i32 273, i32 116, i32 135, i32 198, i32 126,
	i32 106, i32 179, i32 295, i32 131, i32 226, i32 207, i32 293, i32 147,
	i32 156, i32 247, i32 235, i32 242, i32 308, i32 273, i32 97, i32 24,
	i32 277, i32 192, i32 143, i32 270, i32 266, i32 175, i32 3, i32 206,
	i32 167, i32 223, i32 100, i32 161, i32 99, i32 25, i32 93, i32 168,
	i32 172, i32 218, i32 3, i32 337, i32 244, i32 1, i32 114, i32 295,
	i32 247, i32 255, i32 209, i32 33, i32 6, i32 341, i32 156, i32 210,
	i32 339, i32 53, i32 0, i32 249, i32 85, i32 284, i32 269, i32 44,
	i32 254, i32 104, i32 47, i32 138, i32 205, i32 64, i32 264, i32 69,
	i32 80, i32 59, i32 89, i32 154, i32 205, i32 224, i32 133, i32 110,
	i32 331, i32 264, i32 271, i32 171, i32 134, i32 140, i32 40, i32 318,
	i32 304, i32 198, i32 308, i32 199, i32 60, i32 261, i32 309, i32 79,
	i32 25, i32 36, i32 99, i32 258, i32 71, i32 22, i32 315, i32 235,
	i32 203, i32 342, i32 121, i32 69, i32 107, i32 348, i32 265, i32 119,
	i32 117, i32 250, i32 251, i32 11, i32 2, i32 124, i32 115, i32 142,
	i32 41, i32 87, i32 219, i32 173, i32 27, i32 148, i32 332, i32 184,
	i32 292, i32 218, i32 1, i32 220, i32 210, i32 44, i32 234, i32 149,
	i32 0, i32 249, i32 18, i32 86, i32 320, i32 41, i32 254, i32 228,
	i32 207, i32 259, i32 94, i32 186, i32 28, i32 41, i32 78, i32 312,
	i32 243, i32 231, i32 311, i32 144, i32 108, i32 229, i32 11, i32 105,
	i32 137, i32 16, i32 122, i32 66, i32 157, i32 22, i32 322, i32 302,
	i32 102, i32 184, i32 301, i32 63, i32 58, i32 200, i32 321, i32 110,
	i32 304, i32 173, i32 314, i32 178, i32 299, i32 9, i32 289, i32 120,
	i32 98, i32 178, i32 105, i32 262, i32 199, i32 111, i32 221, i32 49,
	i32 20, i32 261, i32 237, i32 72, i32 233, i32 155, i32 39, i32 320,
	i32 35, i32 297, i32 38, i32 326, i32 288, i32 108, i32 335, i32 21,
	i32 294, i32 260, i32 212, i32 203, i32 311, i32 15, i32 190, i32 79,
	i32 79, i32 237, i32 190, i32 240, i32 267, i32 275, i32 152, i32 21,
	i32 201, i32 319, i32 50, i32 51, i32 296, i32 345, i32 335, i32 94,
	i32 214, i32 331, i32 16, i32 211, i32 123, i32 328, i32 160, i32 45,
	i32 292, i32 176, i32 116, i32 63, i32 166, i32 182, i32 14, i32 274,
	i32 111, i32 221, i32 60, i32 298, i32 121, i32 334, i32 2, i32 344,
	i32 246, i32 260, i32 315, i32 297, i32 260, i32 6, i32 228, i32 324,
	i32 242, i32 194, i32 17, i32 342, i32 321, i32 77, i32 232, i32 131,
	i32 294, i32 334, i32 83, i32 188, i32 12, i32 34, i32 119, i32 302,
	i32 255, i32 244, i32 85, i32 213, i32 18, i32 285, i32 183, i32 191,
	i32 253, i32 72, i32 95, i32 165, i32 248, i32 82, i32 350, i32 222,
	i32 227, i32 298, i32 154, i32 36, i32 151, i32 346, i32 193, i32 349,
	i32 144, i32 56, i32 113, i32 228, i32 282, i32 310, i32 281, i32 37,
	i32 350, i32 182, i32 115, i32 220, i32 14, i32 214, i32 146, i32 43,
	i32 202, i32 218, i32 98, i32 301, i32 168, i32 16, i32 48, i32 107,
	i32 97, i32 180, i32 264, i32 27, i32 128, i32 29, i32 326, i32 314,
	i32 174, i32 275, i32 128, i32 44, i32 237, i32 243, i32 149, i32 8,
	i32 191, i32 208, i32 266, i32 327, i32 340, i32 339, i32 132, i32 338,
	i32 42, i32 302, i32 33, i32 351, i32 46, i32 143, i32 261, i32 200,
	i32 252, i32 238, i32 138, i32 62, i32 132, i32 318, i32 48, i32 160,
	i32 225, i32 252, i32 214, i32 306, i32 250, i32 334, i32 281, i32 46,
	i32 164, i32 195, i32 248, i32 197, i32 195, i32 311, i32 323, i32 245,
	i32 192, i32 330, i32 203, i32 18, i32 8, i32 176, i32 236, i32 124,
	i32 59, i32 141, i32 268, i32 333, i32 256, i32 196, i32 290, i32 287,
	i32 150, i32 142, i32 300, i32 297, i32 126, i32 299, i32 160, i32 162,
	i32 239, i32 217, i32 183, i32 336, i32 26, i32 266, i32 253, i32 191,
	i32 82, i32 287, i32 127, i32 291, i32 101, i32 148, i32 289, i32 269,
	i32 54, i32 162, i32 167, i32 131, i32 211, i32 37, i32 283, i32 333,
	i32 22, i32 112, i32 90, i32 240, i32 50, i32 60, i32 122, i32 83,
	i32 127, i32 163, i32 290, i32 166, i32 274, i32 276, i32 241, i32 213,
	i32 179, i32 257, i32 4, i32 251, i32 329, i32 170, i32 2, i32 262,
	i32 116, i32 194, i32 219, i32 19, i32 187, i32 89, i32 65, i32 30,
	i32 185, i32 322, i32 233, i32 59, i32 111, i32 253, i32 32, i32 128,
	i32 159, i32 340, i32 231, i32 140, i32 240, i32 336, i32 153, i32 17,
	i32 230, i32 216, i32 75, i32 74, i32 15, i32 169, i32 85, i32 298,
	i32 124, i32 252, i32 263, i32 232, i32 343, i32 259, i32 34, i32 118,
	i32 139, i32 122, i32 106, i32 320, i32 283, i32 212, i32 227, i32 327,
	i32 317, i32 54, i32 47, i32 28, i32 145, i32 187, i32 147, i32 0,
	i32 296, i32 35, i32 343, i32 173, i32 288, i32 75, i32 161, i32 1,
	i32 277, i32 339, i32 332, i32 159, i32 12, i32 155, i32 151, i32 76,
	i32 192, i32 103, i32 112, i32 224, i32 315, i32 307, i32 65, i32 307,
	i32 66, i32 286, i32 313, i32 45, i32 226, i32 109, i32 7, i32 223,
	i32 55, i32 219, i32 64, i32 317, i32 236, i32 20, i32 109, i32 101,
	i32 62, i32 142, i32 217, i32 7, i32 195, i32 332, i32 170, i32 50,
	i32 286, i32 115, i32 141, i32 176, i32 166, i32 80, i32 113, i32 263,
	i32 181, i32 17, i32 73, i32 267, i32 89, i32 215, i32 316, i32 87,
	i32 120, i32 280, i32 221, i32 135, i32 153, i32 106, i32 11, i32 90,
	i32 31, i32 181, i32 345, i32 136, i32 337, i32 340, i32 278, i32 216,
	i32 40, i32 351, i32 277, i32 177, i32 139, i32 301, i32 303, i32 25,
	i32 349, i32 73, i32 248, i32 279, i32 174, i32 204, i32 27, i32 67,
	i32 88, i32 95, i32 113, i32 31, i32 104, i32 251, i32 37, i32 72,
	i32 212, i32 305, i32 293, i32 108, i32 123, i32 223, i32 87, i32 186,
	i32 86, i32 331, i32 93, i32 185, i32 129, i32 263, i32 313, i32 280,
	i32 188, i32 274, i32 236, i32 279, i32 233, i32 290, i32 183, i32 163,
	i32 130, i32 187, i32 284, i32 271, i32 184, i32 10, i32 49, i32 347,
	i32 91, i32 347, i32 150, i32 62, i32 136, i32 150, i32 61, i32 186,
	i32 117, i32 137, i32 84, i32 249, i32 349, i32 159, i32 281, i32 143,
	i32 328, i32 245, i32 82, i32 70, i32 222, i32 136, i32 234, i32 215,
	i32 310, i32 306, i32 125, i32 307, i32 54, i32 110, i32 130, i32 88,
	i32 23, i32 74, i32 129, i32 31, i32 73, i32 258, i32 330, i32 158,
	i32 23, i32 4, i32 170, i32 338, i32 123, i32 329, i32 324, i32 114,
	i32 172, i32 32, i32 3, i32 206, i32 164, i32 282, i32 30, i32 19,
	i32 257, i32 93, i32 36, i32 5, i32 288, i32 225, i32 299, i32 155,
	i32 278, i32 292, i32 232, i32 265, i32 284, i32 208, i32 76, i32 63,
	i32 268, i32 147, i32 229, i32 121, i32 134, i32 270, i32 293, i32 202,
	i32 312, i32 100, i32 39, i32 217, i32 323, i32 68, i32 26, i32 75,
	i32 78, i32 256, i32 200, i32 24, i32 152, i32 38, i32 336, i32 225,
	i32 133, i32 103, i32 289, i32 57, i32 165, i32 91, i32 61, i32 132,
	i32 46, i32 133, i32 239, i32 145, i32 196, i32 78, i32 234, i32 198,
	i32 257, i32 194, i32 154, i32 321, i32 313, i32 83, i32 348, i32 309,
	i32 346, i32 61, i32 96, i32 316, i32 272, i32 153, i32 327, i32 118,
	i32 189, i32 6, i32 15, i32 74, i32 317, i32 146, i32 52, i32 70,
	i32 23, i32 158, i32 126, i32 65, i32 265, i32 112, i32 267, i32 255,
	i32 55, i32 53, i32 207, i32 241, i32 107, i32 135, i32 246, i32 256,
	i32 80, i32 250, i32 345, i32 254, i32 129, i32 64, i32 152, i32 175
], align 4

@marshal_methods_number_of_classes = dso_local local_unnamed_addr constant i32 0, align 4

@marshal_methods_class_cache = dso_local local_unnamed_addr global [0 x %struct.MarshalMethodsManagedClass] zeroinitializer, align 8

; Names of classes in which marshal methods reside
@mm_class_names = dso_local local_unnamed_addr constant [0 x ptr] zeroinitializer, align 8

@mm_method_names = dso_local local_unnamed_addr constant [1 x %struct.MarshalMethodName] [
	%struct.MarshalMethodName {
		i64 u0x0000000000000000, ; name: 
		ptr @.MarshalMethodName.0_name; char* name
	} ; 0
], align 8

; get_function_pointer (uint32_t mono_image_index, uint32_t class_index, uint32_t method_token, void*& target_ptr)
@get_function_pointer = internal dso_local unnamed_addr global ptr null, align 8

; Functions

; Function attributes: memory(write, argmem: none, inaccessiblemem: none) "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" uwtable willreturn
define void @xamarin_app_init(ptr nocapture noundef readnone %env, ptr noundef %fn) local_unnamed_addr #0
{
	%fnIsNull = icmp eq ptr %fn, null
	br i1 %fnIsNull, label %1, label %2

1: ; preds = %0
	%putsResult = call noundef i32 @puts(ptr @.str.0)
	call void @abort()
	unreachable 

2: ; preds = %1, %0
	store ptr %fn, ptr @get_function_pointer, align 8, !tbaa !3
	ret void
}

; Strings
@.str.0 = private unnamed_addr constant [40 x i8] c"get_function_pointer MUST be specified\0A\00", align 1

;MarshalMethodName
@.MarshalMethodName.0_name = private unnamed_addr constant [1 x i8] c"\00", align 1

; External functions

; Function attributes: noreturn "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8"
declare void @abort() local_unnamed_addr #2

; Function attributes: nofree nounwind
declare noundef i32 @puts(ptr noundef) local_unnamed_addr #1
attributes #0 = { memory(write, argmem: none, inaccessiblemem: none) "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+fix-cortex-a53-835769,+neon,+outline-atomics,+v8a" uwtable willreturn }
attributes #1 = { nofree nounwind }
attributes #2 = { noreturn "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+fix-cortex-a53-835769,+neon,+outline-atomics,+v8a" }

; Metadata
!llvm.module.flags = !{!0, !1, !7, !8, !9, !10}
!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!llvm.ident = !{!2}
!2 = !{!".NET for Android remotes/origin/release/9.0.1xx @ 0ccdc57cf7fc59bd3f6cbf900c9cdbebadfe4609"}
!3 = !{!4, !4, i64 0}
!4 = !{!"any pointer", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C++ TBAA"}
!7 = !{i32 1, !"branch-target-enforcement", i32 0}
!8 = !{i32 1, !"sign-return-address", i32 0}
!9 = !{i32 1, !"sign-return-address-all", i32 0}
!10 = !{i32 1, !"sign-return-address-with-bkey", i32 0}
