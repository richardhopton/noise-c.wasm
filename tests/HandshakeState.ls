/**
 * @package noise-c.wasm
 * @author  Nazar Mokrynskyi <nazar@mokrynskyi.com>
 * @license 0BSD
 */
createLib		= require('..')
randombytes		= require('crypto').randomBytes
test			= require('tape')

patterns			= [
	'N' 'X' 'K'
	'NN' 'NK' 'NX' 'XN' 'XK' 'XX' 'KN' 'KK' 'KX' 'IN' 'IK' 'IX'
]
curves				= ['25519']
ciphers				= ['ChaChaPoly']
hashes				= ['SHA256']
prologues			= [null, new Uint8Array, randombytes(10)]
psks				= [null, new Uint8Array, randombytes(32)]
ads					= [new Uint8Array, randombytes(256)]
plaintexts			= [new Uint8Array, Uint8Array.from(randombytes(10))]
static_keys			=
	NOISE_ROLE_INITIATOR	:
		private	:
			'25519'		: Buffer.from('e61ef9919cde45dd5f82166404bd08e38bceb5dfdfded0a34c8df7ed542214d1', 'hex')
			'448'		: Buffer.from('34d564c4be963d1b2a89fcfe83e6a72b5e3f5e3127f9f596ffc7575e418dfc1f4e827cfc10c9fed38e92ad56ddf8f08571430df2e76d5411', 'hex')
			'NewHope'	: Buffer.from('934d60b35624d740b30a7f227af2ae7c678e4e04e13c5f509eade2b79aea77e23e2a2ea6c9c476fc4937b013c993a793d6c0ab9960695ba838f649da539ca3d0', 'hex')
		public	:
			'25519'		: Buffer.from('6bc3822a2aa7f4e6981d6538692b3cdf3e6df9eea6ed269eb41d93c22757b75a', 'hex')
			'448'		: Buffer.from('301551eca1788f4451c269beafed110b51f08c0494a8de614a184ff3d467d7defdfc7c138e4669591108b69a056d25cafda289f22d1f32c0', 'hex')
			'NewHope'	: Buffer.from('a857f3c12d1ea43ccd04ebc9ed8d785369e47e76325aac7788dc7498676452db778e7d50d397c5e1794adf2593dbc322ac214c7337d3d83ad7a819a3635653d32e8133b4a5888a0ae022497a1010a71d37c628a05ee0e2a0326d2728ef335bb9904232eaa1799c620f2b5d21ca46eca6ba5076c6a50447835fd53441c856e38e7e8ad26a4f5bd239c73fc2889b0aeb44bffdbee787c1f2a4be05f993d22b16f8ad45930c593c5065f5c43b566ccc7e5761a0a792d91c42e18755888472e91399a07f3e48b813644a19dd0e9a1ae2fa5f88961e0f0b16f05c151f8b91e0006423adcfc372e9c261e02f973696706870899dc7196a262ccf2ef689e8027788390a5b2012a91c45e6f87189c290bfd8de694a52d9e9f22db495968566e4805015839fab857d40520a541e81d8710dc79ebabae0754ed9a5858908811214562d07c13440f3152ca9eee11523066de0b48937b34de8e15d8849099576a5205c84510b1789e17daf9b6c09c44c005edc2c6071c4e4b8bbe5cbf879b98fc1649a2162e42282116fb4c6126711c2b8d83d15bfa38f9726c6c952824d05ca9f86bff00e4eb46b2c4e4955bbc202653f85e43c193226470aa14f239fe87010d2b4f1cef0b6159f4774a9a0250dc725d4f90d6c5b8941a5e8510c37d135208276415e9b5235a7d420f6e14989700403621193e97c18670e662d69a84db81cc0f2d118da3639a9c3564fde48c34c5057a025195c2b130217f515729631667d5e8b6e053c49c3f038abe42580c0a8372e9c19404a0d8c26682bf0be984677adcbf9ebe20866a27ac2e7b69f94a0c6c0e9b13c9758695365dcb10f05f65502ae584986c5e1f338864e2365645df0a6c7e57a8b839612aca05049d8c2476deab9b7ef591909c6cd00b77186eca6e839d0699bb8e3a70646e606abd38a221f64704d5b69282e308fae9b8f3632d1328c1a8130bc046a7348e932ce903388086e3439ba6da26cdba215f9287cecfc33f5a683d4a053284f3e4101c09a404f6a4e3cdb121a89a9170a5125c339b4b7f4a31012479e4c11d726528191594ac2d9b4f40cb2a768ab1331a268b36bbfbaaae493b04dd21aca0a6159226ee92950a368180ee7f45aa94759aef037786a29e7f54733da5d076abec3ad5dbc1043cd48f0226e8b92730111d88b5a43623058d642086afe5452d8a5a793bac60a664e06cbce9bdf85bc2bc908c408a0b1761125574ef802c6abea6ada34b77eca22662604488f8e76229d740a2de0609061dc63f4c0adb054fa543dcd2fa0135a391568bb99d262a3c0a7564aec6637599ef3890ec1934ca38627d84e9fe0e8baf6a174ad1767ed84eeda59a50345f9954c498f4c882ac9650e038efa76626d17421690d499750f2967732557b5a8960a66c7695e460748b0145f5607f008fbca75a5b053c7b74a338832928794579c683efae120163f6ca76f6cb7594826603241ed236d9cb4c1c774e74d5e3b605406b800ca70b36338a05149599cd4b1704f295c66c3355911d4782a88851a187a3f4bc7f7978ac8369eed9b42fe9c16a882df139de45f2eeb1a61dec425432838d9e5145aecc534d04c729ac568b74845795715473b2488928a9f8f6ab89f212bcfa9a5b4581145c759e967fca8a4ba1b2da80e40ad48c2cb44ea7a57f54de8f22b7932c4acdb704e98194443b732a819003c9e16170c4a0009eb0046028881aacad75914326a792f687483299667c0aee2a99c12ec4ad6db41f186955788c8d600559e837563ac8e9c46da26a034d56ba3e1684bb9ac81721329707a2a9fd4e5ec179f4479bce275986c59b9346eb1106f2414788f86d5b7fe167fdea141647c93298008414f49567222860ac5c141f8e163e75556bb4542b7021716a5e7044bf4eb460ab915ca642e4225ed031933e89282c10337e9923912c5dbe741ec9aa2c5593aea9e6899656e2dc9e2359fe59243f05f515b974b4e991cb898554c00c142d827a00cc1401f6d0c675cada73ee69692e7ee0913b5af5c970082e8c4b4305bb398c21c7fa14b4c89c55d5cfd19a6c16c9d589a2e751060f8313dc7b9a736c044e10afe6bfea4be885963182f8eaebfa2eecbb6b1025f5c4df780e692066e5fb484d17758522ac4a8b5b4ffe438115165aa42195e8612417ff7c3e6a07eacaf8daff57639447949cbb987c21c03c1817d6a2d4e8930d652023926a67bc7d2772505b665e02fe7437c57bc0ca57acdf5649aaa3a16f569aeb5a38c27c1b80faea8acb515006e8023bef6e08d11a218ad3b68923c4645a8f409f2aaebdf5174952474a8e68b26417148d8144fb106600ca6dbb0883b1a0c03ce8580d87a88995c5854dc75839d53f4e939ee3ed0820cb737ec49fde77c9987e053585982300824841c0c5d8686819ce111317867c15068911e092fed4aba53a7a1b9406f648c22026bfd27634b5c774b00252c41550b0a2d0040d684c20259aa95d095f8bb3a0ca4dae2e0c4fd68c94e9f330fa96f271e7f0953799b9e5c5b15798178349a9e8c91d116780ff9c7db6089ed4c06b34edaa848bbffd98542827e5331be', 'hex')
	NOISE_ROLE_RESPONDER	:
		private	:
			'25519'		: Buffer.from('4a3acbfdb163dec651dfa3194dece676d437029c62a408b4c5ea9114246e4893', 'hex')
			'448'		: Buffer.from('a9b45971180882a79b89a3399544a425ef8136d278efa443ed67d3ff9d36e883bc330c6295bbf6ed73ff6fd10cbed767ad05ce03ebd27c7c', 'hex')
			'NewHope'	: Buffer.from('bac5ba881dd35c59719670004692d675b83c98db6a0e55800bafeb7e70491bf4', 'hex')
		public	:
			'25519'		: Buffer.from('31e0303fd6418d2f8c0e78b91f22e8caed0fbe48656dcf4767e4834f701b8f62', 'hex')
			'448'		: Buffer.from('bd200fa6d50db3a743797b00aca1b70f417bfc381b28b21b5835d84cf7a6da6abba19e3ba7d46b253412b74665d4627b65fcef3f29c95d3e', 'hex')
			'NewHope'	: Buffer.from('9fa8e0059a9c599ba3eb564cae21b98080a2be184137c694a38d865bef4d58118a6e0d818d89949fee5be1070459f1e044e166b8434eee2d6095fcfac6057f488c24a4bf227371ea9d966d711dad8fed1a0e084ebd0886a0cd30a881d489b8c05c9655ca5d8813548d12a08a68d6f1ba1741dc06729aab4c6cfa471a72b091cad4398d569974cf95eb77629d130cf98b4544bce7e768caf2428944406f170b4828449eda5aa15a1b202ae73b411d009e2f9189ed641686001f78384079098ec5eaac9e4ad95659c8f768be91d2ed770af58a211a91e3bf94560e9a11432e50a1301d0f35381e76000d9ac4ffaa41286d235129ce87c3c9a77b01eaaf136da7477149bc9eadda78931107892d996009f536bf44bdd05f765d6996303bf2ec3916e4dcfb0ffe62eea9607afdd98803497ed14cbe0db1601145d69e4dd16257d978a808daad03f2ac99062f8aa767dc2a8d17ed6d6405b93ff3c495616c544b5e42727a034d14bb5fe5d18c40bbb68400a8bf4979f347aa51081a6b700ac429873ebeae8310c79b59900be23e44b0e49dd3de17756efc3ddd90b9324930b2b41993884b350b5f0f5044653e8a7b9490aa4345539cce78b06e189ab6d1bf2402254e25c2dcb7e6c838c2e04a91ea5a7b5f650c52289d0d492ca4ab31bc25114eed6711cc0800d378b1ae741a7e227717bc9c0cfbc473f50761388f6ad2e403a1951566e7f413584f32c30655f08121266973e03c310c1997f92347e8b676d7fb4178f992f544dd213c5167b168c71552e077049984e8d22286e84b7ce2091a76c0a687459a6d72b724d001fd96aee66d0b5b090c3b896b27d900c28445600d8530054b471f6ef12d7e61828409075fe82704cc85fbe97073f385af6b75e9606ec31796e048b44ba9324a2bb254df16a7ab90164c035e421243a14c61d297725b8abb5b6122c7172928bccc4ae775159a546116789e12a09c440ab03f5d94b8c85409dbeda0bc1c729668dd677856010b9c41524654cd925702692a0735e4fd44880dec83c037ed6517115c28055602648c7a6647b516db1d8d28f0b899aa1ce0f09ae53da15e186983354180ce8ed07dee87a567ce18b705be610fd0a551850f79a364a88115338b064421dd7812e683d197548242565f9eb70d443f860c19d0c2aa1c84eaf1b4f90921c9eb28f1d33c36f91ce77420dd78179d11e0ef3d74835e04684f814fdd4653ebb16abbb4104abb0d193225504237061e58be52d7eae3d9b0b9d8f8401e4e1a4e0ab88435984806429ae61e455d0887d310acc197c09f51c0618886ecdd2fc16b1d2f0805d63a89768b1f537ad15bdcb5ab2b67978e46aedfd9e4091ec120a6e997059b5a44399f9078aa6134454043840770a56c26942248a14d60cbeb2768213e1e8420c35bd984fa43d70b1c49bd18633fa1f4ae28fa205ae6107cb570c3956516653cd723ccd4a0a42f0fa1690217711713cff2775632a850a7ac616b1ebd5924c7d9d38c2d326ebef3545c249451b9506d3ab92492c6926d8d1de12cb4977ba1730fdffe33618a28b7570a8aff6a1ec42323b114343c1481b5383dfa4ea68814a5d51062321ecfe2371056b0285395d84e387a9d86217526009398868438e030ffa7df8387599e74c2ec80dead3bc9dc7ad947bdaf4f90e1e86f149a026c6b5b8d35a71cc0b1f2b8e6782925b28bb4d16f03ab548460a05db0e9c1daf5e52b99c8527a0ba183850e04f8dc8c7b0e2ac1b90dc411a646b8d830b6bbf35da0c502d27db56f67a8ffbc806ee1557793992b52649828e2d191325f152278d1a438810b403c9695e5ee622b266a739cdba059b26d40852f61d40e9c1fa71c74c7d24d148f5769e066bab710ee65e3889268a913c854a7e1a1db27a229aafa94aa5941941848a12d81f1109c517891e4c2578292a4404b67a361a118e0dc76286a425a1a538a376f2eb2fbd6055a5a1e568b5ddbab1b581c298ed3f85054927e586571704a472708e081b750754d00c2090037875229e6c03de287798c25f444352576cd3c76190e331d8b9037a2487b4a4280c8468d9efddf29e2ee202b6e9b5f15148c9a06d40ff619a57dedef2e0adf05618d08ed31fa5901d0e19c08bfc0212ee83c0a33c6408c83e11b75564c892d963b48ce76bad3e5f96fe004e84640069c5a7d8dacef2934c94cac8ab9d78a404d9212896b6fb9a90509eb6b45614bc997c6da53128f4462d1f202f2b08e5ee440a1e88072e8d9b0e5bc141a893976ec923c7193d266754686301f30f49a7a61e46cc41b560d8b4b0731e64a05511b917d40bc7a4ebcc80986fb7a85c79a3a90e92845bda876bb2d141a25afd1a583a8aa61a9f3278e1da993dbf78ac8309251a685f1870613e3056673eb222fa2abbb43b551003b2c65a26284692e0103f865d0767d5ddb3bb02001deabbacb14dc7bb969db32e8ba323c0bed06fcadba0d8c8b4499f281418a7111df756acb128d95e5ad7313cae445522825cc6d47e812011c5e5d6f9341c9490badf4fba64b5e4d59898d998d822f846aa1271f250eaff7554d53894c822d38', 'hex')
roles_keys			=
	'NOISE_ROLE_INITIATOR'
	'NOISE_ROLE_RESPONDER'
	null
no_empty_keys		=
	# Any pattern that starts with K, X or I requires initiator's static private key
	local	: /^[KXI]/
	# Any one-way pattern or pattern that ends with K, X or I requires responders's static public key
	remote	: /(^.|[KXI])$/
roundtrip_halves	=
	1	:
		initiator	: ['NOISE_ACTION_WRITE_MESSAGE']
		responder	: ['NOISE_ACTION_READ_MESSAGE']
	2	:
		initiator	: ['NOISE_ACTION_WRITE_MESSAGE' 'NOISE_ACTION_READ_MESSAGE']
		responder	: ['NOISE_ACTION_READ_MESSAGE' 'NOISE_ACTION_WRITE_MESSAGE']
	3	:
		initiator	: ['NOISE_ACTION_WRITE_MESSAGE' 'NOISE_ACTION_READ_MESSAGE' 'NOISE_ACTION_WRITE_MESSAGE']
		responder	: ['NOISE_ACTION_READ_MESSAGE' 'NOISE_ACTION_WRITE_MESSAGE' 'NOISE_ACTION_READ_MESSAGE']
expected_actions	=
	N	: roundtrip_halves.1
	X	: roundtrip_halves.1
	K	: roundtrip_halves.1
	NN	: roundtrip_halves.2
	NK	: roundtrip_halves.2
	NX	: roundtrip_halves.2
	XN	: roundtrip_halves.3
	XK	: roundtrip_halves.3
	XX	: roundtrip_halves.3
	KN	: roundtrip_halves.2
	KK	: roundtrip_halves.2
	KX	: roundtrip_halves.2
	IN	: roundtrip_halves.2
	IK	: roundtrip_halves.2
	IX	: roundtrip_halves.2

# Convenient for debugging common issues instead of looping through thousands of combinations
#patterns	= [patterns[0]]
#curves		= [curves[0]]
#ciphers		= [ciphers[0]]
#hashes		= [hashes[0]]
#prologues	= [prologues[0]]
#psks		= [psks[0]]
#ads			= [ads[0]]
#plaintexts	= [plaintexts[0]]

if process.env.FAST_HANDSHAKESTATE
	prologues	= prologues.slice(-1)
	psks		= psks.slice(-1)
	ads			= ads.slice(-1)
	plaintexts	= plaintexts.slice(-1)

lib				<-! createLib
lib_internal	= lib._lib_internal
for let pattern in patterns => for let curve in curves => for let cipher in ciphers => for let hash in hashes => for let prologue in prologues => for let psk in psks => for let role_key_s in roles_keys => for let role_key_rs in roles_keys
	# NewHope not supported with other patterns: https://rweather.github.io/noise-c/index.html#algorithms
	if curve == 'NewHope' && pattern != 'NN'
		return
	# Skip some loops where patterns require local or remote keys to be present, but they are `null` for this particular loop iteration
	if !role_key_s && no_empty_keys.local.test(pattern)
		return
	if !role_key_rs && no_empty_keys.remote.test(pattern)
		return
	protocol_name	= "Noise_#{pattern}_#{curve}_#{cipher}_#{hash}"
	prologue_title	= if prologue then "length #{prologue.length}" else 'null'
	psk_title		= if psk then "length #{psk.length}" else 'null'

	for let ad in ads => for let plaintext in plaintexts
		test("HandshakeState: #protocol_name, prologue #prologue_title, psk #psk_title, role_key_s #role_key_s, role_key_rs #role_key_rs, plaintext length #{plaintext.length}, ad length #{ad.length}", (t) !->
			var initiator_hs, responder_hs
			t.doesNotThrow (!->
				initiator_hs	:= lib.HandshakeState(protocol_name, lib.constants.NOISE_ROLE_INITIATOR)
			), "Initiator constructor doesn't throw an error"

			t.doesNotThrow (!->
				responder_hs	:= lib.HandshakeState(protocol_name, lib.constants.NOISE_ROLE_RESPONDER)
			), "Responder constructor doesn't throw an error"

			if role_key_s
				initiator_sp = static_keys[role_key_s].public[curve]
			if role_key_rs
				responder_sp = static_keys[role_key_rs].public[curve]

			t.doesNotThrow (!->
				s	= role_key_s
				if s
					s	= static_keys[s].private[curve]
				rs	= role_key_rs
				if rs
					rs	= static_keys[rs].public[curve]
				initiator_hs.Initialize(prologue, s, rs, psk)
			), "Initiator Initialize() doesn't throw an error"

			t.doesNotThrow (!->
				s	= role_key_rs
				if s
					s	= static_keys[s].private[curve]
				rs	= role_key_s
				if rs
					rs	= static_keys[rs].public[curve]
				responder_hs.Initialize(prologue, s, rs, psk)
			), "Responder Initialize() doesn't throw an error"

			initiator_actions	= expected_actions[pattern].initiator.slice()
			responder_actions	= expected_actions[pattern].responder.slice()
			var message
			:initiator_loop while action = initiator_actions.shift()
				if action
					t.equal(initiator_hs.GetAction(), lib.constants[action], "Initiator expected action: #action")

				switch action
					case 'NOISE_ACTION_WRITE_MESSAGE'
						t.doesNotThrow (!->
							message	:= initiator_hs.WriteMessage()
						), "Initiator WriteMessage() doesn't throw an error"

						while action = responder_actions.shift()
							if action
								t.equal(responder_hs.GetAction(), lib.constants[action], "Responder expected action: #action")

							switch action
								case 'NOISE_ACTION_READ_MESSAGE'
									t.doesNotThrow (!->
										responder_hs.ReadMessage(message, true)
									), "Responder ReadMessage() doesn't throw an error"

								case 'NOISE_ACTION_WRITE_MESSAGE'
									t.doesNotThrow (!->
										message	:= responder_hs.WriteMessage()
									), "Responder WriteMessage() doesn't throw an error"

									continue initiator_loop

					case 'NOISE_ACTION_READ_MESSAGE' ''
						t.doesNotThrow (!->
							initiator_hs.ReadMessage(message, true)
						), "Initiator ReadMessage() doesn't throw an error"

			t.equal(initiator_hs.GetAction(), lib.constants.NOISE_ACTION_SPLIT, 'Initiator is ready to split')
			t.equal(responder_hs.GetAction(), lib.constants.NOISE_ACTION_SPLIT, 'Responder is ready to split')

			t.deepEqual(initiator_hs.GetHandshakeHash(), responder_hs.GetHandshakeHash(), 'Handshake hash must match')
			if pattern in ['IX', 'KX', 'XX', 'NX']
				t.deepEqual(initiator_hs.GetRemotePublicKey(), responder_sp, 'Initiator remote public match')
			var initiator_send, initiator_receive
			t.doesNotThrow (!->
				[initiator_send, initiator_receive]	:= initiator_hs.Split()
			), "Initiator Split() doesn't throw an error"
			t.ok(initiator_send instanceof lib.CipherState, 'Initiator Element #1 after Split() implements CipherState')
			t.ok(initiator_receive instanceof lib.CipherState, 'Initiator Element #2 after Split() implements CipherState')

			t.throws (!->
				initiator_hs.Initialize(plaintext)
			), Error, "Initiator HandshakeState shouldn't be usable after Split() is called"

			if pattern in ['IN', 'IX', 'XN', 'XX']
				t.deepEqual(responder_hs.GetRemotePublicKey(), initiator_sp, 'Responder remote public match')
			var responder_send, responder_receive
			t.doesNotThrow (!->
				[responder_send, responder_receive]	:= responder_hs.Split()
			), "Responder Split() doesn't throw an error"
			t.ok(responder_send instanceof lib.CipherState, 'Responder Element #1 after Split() implements CipherState')
			t.ok(responder_receive instanceof lib.CipherState, 'Responder Element #2 after Split() implements CipherState')

			t.throws (!->
				responder_hs.Initialize(plaintext)
			), Error, "Responder HandshakeState shouldn't be usable after Split() is called"

			# Initiator sends data
			ciphertext	= initiator_send.EncryptWithAd(ad, plaintext)

			t.equal(ciphertext.length, plaintext.length + initiator_send._mac_length, 'Initiator ciphertext has expected length')
			# Empty plaintext will be, obviously, the same as empty ciphertext
			if plaintext.length
				t.notEqual(ciphertext.slice(0, plaintext.length).toString(), plaintext.toString(), 'Initiator ciphertext is not the same as plaintext')
			initiator_send.free()

			# Responder receives data
			plaintext_decrypted	= responder_receive.DecryptWithAd(ad, ciphertext)
			responder_receive.free()

			t.equal(plaintext_decrypted.toString(), plaintext.toString(), 'Responder plaintext decrypted correctly')

			# Responder sends data
			ciphertext	= responder_send.EncryptWithAd(ad, plaintext)

			t.equal(ciphertext.length, plaintext.length + responder_send._mac_length, 'Responder ciphertext has expected length')
			# Empty plaintext will be, obviously, the same as empty ciphertext
			if plaintext.length
				t.notEqual(ciphertext.slice(0, plaintext.length).toString(), plaintext.toString(), 'Responder ciphertext is not the same as plaintext')
			responder_send.free()

			# Initiator receives data
			plaintext_decrypted	= initiator_receive.DecryptWithAd(ad, ciphertext)
			initiator_receive.free()

			t.equal(plaintext_decrypted.toString(), plaintext.toString(), 'Initiator plaintext decrypted correctly')

			t.end()
		)

known_prologue			= Buffer.from('2b20c3ce8a9ca112975d', 'hex')
known_plaintext			= Buffer.from('39fac78f71b0d24b6426', 'hex')
known_ad				= Buffer.from('f0682237b9af3f7f816f', 'hex')
fixed_ephemeral			= Buffer.from('7fd26c8b8a0d5c98c85ff9ca1d7bc66d78578b9f2c4c170850748b27992767e6ea6cc9992a561c9d19dfc342e260c280ef4f3f9b8f879d4e', 'hex')
initiator_ciphertext	= Buffer.from('5f55a604bfab67cadacd393c2a2bdd0db3e71b3aaaa8723a6b13', 'hex')
responder_ciphertext	= Buffer.from('ac2a45dcd95b029807eea7229d15f2612eec814932c7fc450c76', 'hex')

!function set_fixed_ephemeral (hs)
	dh		= lib_internal._noise_handshakestate_get_fixed_ephemeral_dh(hs._state)
	if dh
		s		= lib_internal.allocateBytes(0, fixed_ephemeral)
		error	= lib_internal._noise_dhstate_set_keypair_private(dh, s, s.length)
		s.free()
		if error != lib.constants.NOISE_ERROR_NONE
			throw new Error(error)
	dh		= lib_internal._noise_handshakestate_get_fixed_hybrid_dh(hs._state)
	if dh
		s		= lib_internal.allocateBytes(0, fixed_ephemeral)
		error	= lib_internal._noise_dhstate_set_keypair_private(dh, s, s.length)
		s.free()
		if error != lib.constants.NOISE_ERROR_NONE
			throw new Error(error)

test("HandshakeState: Fallback testing", (t) !->
	var initiator_hs, responder_hs, message
	var initiator_send, initiator_receive
	var responder_send, responder_receive

	t.doesNotThrow (!->
		initiator_hs	:= lib.HandshakeState('Noise_IK_448_ChaChaPoly_BLAKE2b', lib.constants.NOISE_ROLE_INITIATOR)
		responder_hs	:= lib.HandshakeState('Noise_IK_448_ChaChaPoly_BLAKE2b', lib.constants.NOISE_ROLE_RESPONDER)

		# Fix ephemeral key pairs in order to get predictable ciphertext
		set_fixed_ephemeral(initiator_hs)
		set_fixed_ephemeral(responder_hs)

		initiator_hs.Initialize(known_prologue, static_keys.NOISE_ROLE_INITIATOR.private.448, static_keys.NOISE_ROLE_RESPONDER.public.448)
		responder_hs.Initialize(randombytes(10), static_keys.NOISE_ROLE_RESPONDER.private.448, static_keys.NOISE_ROLE_RESPONDER.public.448)

		t.equal(initiator_hs.GetAction(), lib.constants.NOISE_ACTION_WRITE_MESSAGE, "Initiator expected action: NOISE_ACTION_WRITE_MESSAGE")

		# Start IK handshake pattern
		message	:= initiator_hs.WriteMessage()

		t.equal(initiator_hs.GetAction(), lib.constants.NOISE_ACTION_READ_MESSAGE, "Initiator expected action: NOISE_ACTION_READ_MESSAGE")

		t.equal(responder_hs.GetAction(), lib.constants.NOISE_ACTION_READ_MESSAGE, "Responder expected action: NOISE_ACTION_READ_MESSAGE")
	), "Preparation goes well"

	t.throws (!->
		# IK handshake pattern fails here
		responder_hs.ReadMessage(message, false, true)
	), Error, "Responder ReadMessage() throws an error because of different prologue"

	t.doesNotThrow (!->
		# Fallback to XX handshake pattern
		responder_hs.FallbackTo(lib.constants.NOISE_PATTERN_XX_FALLBACK)
		responder_hs.Initialize(known_prologue)
	), "Responder FallbackTo() and Initialize() doesn't throw an error"


	t.doesNotThrow (!->
		# Responder starts XX handshake pattern
		t.equal(responder_hs.GetAction(), lib.constants.NOISE_ACTION_WRITE_MESSAGE, "Responder expected action: NOISE_ACTION_WRITE_MESSAGE")

		message	:= responder_hs.WriteMessage()

		t.equal(responder_hs.GetAction(), lib.constants.NOISE_ACTION_READ_MESSAGE, "Responder expected action: NOISE_ACTION_READ_MESSAGE")

		# Initiator fallbacks to XX pattern too
		t.doesNotThrow (!->
			initiator_hs.FallbackTo(lib.constants.NOISE_PATTERN_XX_FALLBACK)
			initiator_hs.Initialize()
		), "Initiator FallbackTo() and Initialize() doesn't throw an error"

		# Initiator now expects to read message from responder that initialized XX fallback handshake pattern
		t.equal(initiator_hs.GetAction(), lib.constants.NOISE_ACTION_READ_MESSAGE, "Initiator expected action: NOISE_ACTION_READ_MESSAGE")

		initiator_hs.ReadMessage(message)

		t.equal(initiator_hs.GetAction(), lib.constants.NOISE_ACTION_WRITE_MESSAGE, "Initiator expected action: NOISE_ACTION_WRITE_MESSAGE")

		message	:= initiator_hs.WriteMessage()

		# Initiator is ready to split
		t.equal(initiator_hs.GetAction(), lib.constants.NOISE_ACTION_SPLIT, "Initiator expected action: NOISE_ACTION_SPLIT")

		responder_hs.ReadMessage(message)

		# Responder is ready to split
		t.equal(responder_hs.GetAction(), lib.constants.NOISE_ACTION_SPLIT, "Responder expected action: NOISE_ACTION_SPLIT")

		[initiator_send, initiator_receive]	:= initiator_hs.Split()
		[responder_send, responder_receive]	:= responder_hs.Split()
	), "The rest goes well too"

	# Initiator sends data
	ciphertext	= initiator_send.EncryptWithAd(known_ad, known_plaintext)

	t.equal(ciphertext.toString(), Uint8Array.from(initiator_ciphertext).toString(), "Initiator plaintext encrypted correctly")
	initiator_send.free()

	# Responder receives data
	plaintext_decrypted	= responder_receive.DecryptWithAd(known_ad, ciphertext)
	responder_receive.free()

	t.equal(plaintext_decrypted.toString(), Uint8Array.from(known_plaintext).toString(), 'Responder plaintext decrypted correctly')

	# Responder sends data
	ciphertext	= responder_send.EncryptWithAd(known_ad, known_plaintext)

	t.equal(ciphertext.toString(), Uint8Array.from(responder_ciphertext).toString(), 'Responder plaintext encrypted correctly')
	responder_send.free()

	# Initiator receives data
	plaintext_decrypted	= initiator_receive.DecryptWithAd(known_ad, ciphertext)
	initiator_receive.free()

	t.equal(plaintext_decrypted.toString(), Uint8Array.from(known_plaintext).toString(), 'Initiator plaintext decrypted correctly')

	t.end()
)
