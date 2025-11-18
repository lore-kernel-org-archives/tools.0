Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C327D226CF1
	for <tools@linux.kernel.org>; Tue, 18 Nov 2025 15:23:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763479427; cv=none; b=eW72YbYuQ31aG3D7QSfD3edT7NLr8sTT5hHK7ZFqy7+U/GOaike0fzH2a7nDNexdJ+kIDCy0caVQwcdL0nxDiXKg6EGcbZybSPWiE1LZMe3U+Z6XUlQg3Z5nA9AEz7uj/WLt9LwMrxZvzw53/n+EHnbISkYvmWeodKYn/S6GN6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763479427; c=relaxed/simple;
	bh=A2NRBefVAZSTO2561EOJZmMJnIGls+YYugSu86UJhc0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=p8pxpdNFZwVtqOAZbNK0PQVDEZc3mU7xAdmKmSH8TdVs/bUCPvlu3DHjckP4MuQR5zKeOR4KO5/T/Rt3g8blqUkAQ8C3zydfC556fqHVMaw914Jil1PoKzJ0LJtUeLJYA3lwCuQTxij4VBvvQuQywfEX5fEGQLZJ8vcxC0Mtpm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BYPtRlbY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BYPtRlbY"
Received: by smtp.kernel.org (Postfix)
	id 71439C16AAE; Tue, 18 Nov 2025 15:23:47 +0000 (UTC)
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 1AD13C4CEFB
	for <tools@kernel.org>; Tue, 18 Nov 2025 15:23:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 1AD13C4CEFB
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-88051279e87so60126826d6.3
        for <tools@kernel.org>; Tue, 18 Nov 2025 07:23:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763479424; x=1764084224; darn=kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=p1AUOxVkOQKSY60SWhGuAGQgA55Fg+APxDS05iNCOGE=;
        b=BYPtRlbYDpByRsJrsrMt2eJHRpiodQHrH2p95B+50nTT2K7+Zq9R+IWhIwh20cghL0
         CySMyL13wkmTCkgSauI55toGRmxnolmrvnAPQxQH9pc5oFMdVzfKXW0WjvhmExb9gMk3
         tgkxCIdWqZsiBsPaaFNq3bv3ccy+AzYS9phJRIbC0VXIc+0tYXPZxMkSAeEaYLOUeOZL
         PSfhEXZFQJxXdp/3/AEACYL2566AKFC0miluzr23gNXwW+lm5XUrJIOWiV345l+8lgJz
         mU2GL9kQEGoX/trZpaQPVXBqWOtzcYctYWVIro0/pMWvpNjKKuxzKTFVSxwVn2mcrvea
         dZnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763479424; x=1764084224;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p1AUOxVkOQKSY60SWhGuAGQgA55Fg+APxDS05iNCOGE=;
        b=mrfv8E4Ibn40xz7eMjYinSq1CItU/3luqpsusWrMbvq3eaajECF2CKQMRiBOBw+S27
         zR+uLC0hyRV16154V3rT3/HIHJyA8Jytya/NMgW778VV1OAuLa+YcBc50z+6a/QQu9zC
         Wy0YgEacHmVxjyg2Q4xR1yMbb9lEkNwc3ocTItR1KyFJk18mZeFcYEbiusR+1Ky9ZDhc
         vxPwloxk0n8yA61y/yqmB6xFsL1BUkrN9ExqJNa2//RH1+y8Y1JMWNtA6v62Rn4Yk5rF
         8QyDM95tlMHF+Q2x4+w5yT+UMx4cY4y+X7EVapxgj4TVfHGPhuE+Nqm3SD0ZoFr6fSh4
         8dmw==
X-Gm-Message-State: AOJu0Yw6NC/M7zARJtGrQlLMgoI2abM7awerfigGMRqBBLAcZD1Jmf/3
	eTToBNqCVIU4LbSLpe1t8vrubpF0ayGTMrKqs4/DvQg5GgFPzWHoodhvfF+D/g==
X-Gm-Gg: ASbGnctoLz+Bb/Bv/7qr6zeUpz2/DxgbfO2mBFhtyxbMF3dtZyZT5pWuyLKLaYZJe5N
	bdIZxuFzCxc+9H74QCiclIjAnAsr23VO2cbX1yk4+UTZVrFouWesvu3zgEg66lGe0QTGG6as6NZ
	dkZ79mGPf+2CUR1H0ErvsRxckib3q+Muwo69sfkU9lZkQ4X5FEROkxQaZPFn4TvH9/Yt5exSWuo
	UPWDPpLJQIxh8yThLDgly1J4v5qj9F1SK1HCqpOeCiZkYYvKqvV2TFNcNBwtQ2VfoP7awmv0394
	aBj5zlMD25sZ50J4JLWPX3SdDK0e6kDYojHFzlnGZf9Q4fSsmNIsX9r/v9txSaV1CEWua4TP7Gj
	Wf0sImxKWD5FKMM23H5z2n9dsa3a6g1AgMvhSl7sJXSCJaCzLmgrAzPRDa9zifb2ol4c2MUE39M
	gDd4j2jlxl1KaFGOabLk2Q1ln+9cGgE+dXYt5fFtEw8UW10zxrQnSacref5VNDIc7TEAqM6Hnzw
	AMLQwIseJ456ZoafsG4oABSiVDDHXECxG/zIk8ctLzib3eL0+SJsQTfoFpW7aMqbX4lBHZVr6Uh
	0QFXfIvLWvkcTAIHR2OZtmvJ3gUL5/4dGHOJgn8LV1BoLw==
X-Google-Smtp-Source: AGHT+IGvg/pZvmI2UcU5zLQiNPQGL2MZICYMsM6uXqTLMwfvy7v39MFUkw1mEKhFQJyDfdvUd1ixHA==
X-Received: by 2002:ad4:5745:0:b0:880:55fc:c98b with SMTP id 6a1803df08f44-882925f85cbmr242118526d6.22.1763479423525;
        Tue, 18 Nov 2025 07:23:43 -0800 (PST)
Received: from 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa ([208.80.35.37])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8828652ce08sm115453856d6.36.2025.11.18.07.23.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Nov 2025 07:23:42 -0800 (PST)
From: Tamir Duberstein <tamird@gmail.com>
Date: Tue, 18 Nov 2025 10:23:34 -0500
Subject: [PATCH b4] Update shtab requirement to >=1.8
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251118-bump-shtab-v1-1-4126cf1d1e44@gmail.com>
X-B4-Tracking: v=1; b=H4sIAHWPHGkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1NDQ0ML3aTS3ALd4oySxCRdYxMTU1PDpDTjlERLJaCGgqLUtMwKsGHRSkk
 mSrG1tQC75UCuYAAAAA==
X-Change-ID: 20251118-bump-shtab-344551bf3da9
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Tamir Duberstein <tamird@gmail.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openssh-sha256; t=1763479422; l=38898;
 i=tamird@gmail.com; h=from:subject:message-id;
 bh=A2NRBefVAZSTO2561EOJZmMJnIGls+YYugSu86UJhc0=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgtYz36g7iDMSkY5K7Ab51ksGX7hJgs
 MRt+XVZTrIzMVIAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QKv6FizvdHxwDHG0IiH0YI5+sJay6gkgL5ELKOAqDxPE0GvR/hjianUOXZiauuihwFBqdNwzRZ6
 1UUVbZ4IapAw=
X-Developer-Key: i=tamird@gmail.com; a=openssh;
 fpr=SHA256:264rPmnnrb+ERkS7DDS3tuwqcJss/zevJRzoylqMsbc

This release fixes tab completion in zsh. Bump requires-python to >=3.9
to avoid warnings caused by shtab requiring >=3.9.

Link: https://github.com/iterative/shtab/issues/183
Link: https://github.com/iterative/shtab/commit/ad3d4ced44167362fe5031156b7c5fdca59cd02b
Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
 pyproject.toml   |   4 +-
 requirements.txt | 435 +++++++++++++++++++++++++++++++------------------------
 2 files changed, 247 insertions(+), 192 deletions(-)

diff --git a/pyproject.toml b/pyproject.toml
index 7b2c6e2..de7f41e 100644
--- a/pyproject.toml
+++ b/pyproject.toml
@@ -12,7 +12,7 @@ license = {file = "COPYING"}
 authors = [
     {name = "Konstantin Ryabitsev", email="konstantin@linuxfoundation.org"},
 ]
-requires-python = ">=3.8"
+requires-python = ">=3.9"
 classifiers = [
     "Environment :: Console",
     "Operating System :: POSIX :: Linux",
@@ -40,7 +40,7 @@ dev = [
 
 [project.optional-dependencies]
 completion = [
-    "shtab>=1.7",
+    "shtab>=1.8",
 ]
 
 [tool.setuptools.packages.find]
diff --git a/requirements.txt b/requirements.txt
index 3781f49..8c6acf0 100644
--- a/requirements.txt
+++ b/requirements.txt
@@ -1,212 +1,267 @@
 # This file was autogenerated by uv via the following command:
 #    uv pip compile pyproject.toml --generate-hashes
-certifi==2025.4.26 \
-    --hash=sha256:0a816057ea3cdefcef70270d2c515e4506bbc954f417fa5ade2021213bb8f0c6 \
-    --hash=sha256:30350364dfe371162649852c63336a15c70c6510c2ad5015b21c2345311805f3
+certifi==2025.11.12 \
+    --hash=sha256:97de8790030bbd5c2d96b7ec782fc2f7820ef8dba6db909ccf95449f2d062d4b \
+    --hash=sha256:d8ab5478f2ecd78af242878415affce761ca6bc54a22a27e026d7c25357c3316
     # via requests
-cffi==1.17.1 \
-    --hash=sha256:045d61c734659cc045141be4bae381a41d89b741f795af1dd018bfb532fd0df8 \
-    --hash=sha256:0984a4925a435b1da406122d4d7968dd861c1385afe3b45ba82b750f229811e2 \
-    --hash=sha256:0e2b1fac190ae3ebfe37b979cc1ce69c81f4e4fe5746bb401dca63a9062cdaf1 \
-    --hash=sha256:0f048dcf80db46f0098ccac01132761580d28e28bc0f78ae0d58048063317e15 \
-    --hash=sha256:1257bdabf294dceb59f5e70c64a3e2f462c30c7ad68092d01bbbfb1c16b1ba36 \
-    --hash=sha256:1c39c6016c32bc48dd54561950ebd6836e1670f2ae46128f67cf49e789c52824 \
-    --hash=sha256:1d599671f396c4723d016dbddb72fe8e0397082b0a77a4fab8028923bec050e8 \
-    --hash=sha256:28b16024becceed8c6dfbc75629e27788d8a3f9030691a1dbf9821a128b22c36 \
-    --hash=sha256:2bb1a08b8008b281856e5971307cc386a8e9c5b625ac297e853d36da6efe9c17 \
-    --hash=sha256:30c5e0cb5ae493c04c8b42916e52ca38079f1b235c2f8ae5f4527b963c401caf \
-    --hash=sha256:31000ec67d4221a71bd3f67df918b1f88f676f1c3b535a7eb473255fdc0b83fc \
-    --hash=sha256:386c8bf53c502fff58903061338ce4f4950cbdcb23e2902d86c0f722b786bbe3 \
-    --hash=sha256:3edc8d958eb099c634dace3c7e16560ae474aa3803a5df240542b305d14e14ed \
-    --hash=sha256:45398b671ac6d70e67da8e4224a065cec6a93541bb7aebe1b198a61b58c7b702 \
-    --hash=sha256:46bf43160c1a35f7ec506d254e5c890f3c03648a4dbac12d624e4490a7046cd1 \
-    --hash=sha256:4ceb10419a9adf4460ea14cfd6bc43d08701f0835e979bf821052f1805850fe8 \
-    --hash=sha256:51392eae71afec0d0c8fb1a53b204dbb3bcabcb3c9b807eedf3e1e6ccf2de903 \
-    --hash=sha256:5da5719280082ac6bd9aa7becb3938dc9f9cbd57fac7d2871717b1feb0902ab6 \
-    --hash=sha256:610faea79c43e44c71e1ec53a554553fa22321b65fae24889706c0a84d4ad86d \
-    --hash=sha256:636062ea65bd0195bc012fea9321aca499c0504409f413dc88af450b57ffd03b \
-    --hash=sha256:6883e737d7d9e4899a8a695e00ec36bd4e5e4f18fabe0aca0efe0a4b44cdb13e \
-    --hash=sha256:6b8b4a92e1c65048ff98cfe1f735ef8f1ceb72e3d5f0c25fdb12087a23da22be \
-    --hash=sha256:6f17be4345073b0a7b8ea599688f692ac3ef23ce28e5df79c04de519dbc4912c \
-    --hash=sha256:706510fe141c86a69c8ddc029c7910003a17353970cff3b904ff0686a5927683 \
-    --hash=sha256:72e72408cad3d5419375fc87d289076ee319835bdfa2caad331e377589aebba9 \
-    --hash=sha256:733e99bc2df47476e3848417c5a4540522f234dfd4ef3ab7fafdf555b082ec0c \
-    --hash=sha256:7596d6620d3fa590f677e9ee430df2958d2d6d6de2feeae5b20e82c00b76fbf8 \
-    --hash=sha256:78122be759c3f8a014ce010908ae03364d00a1f81ab5c7f4a7a5120607ea56e1 \
-    --hash=sha256:805b4371bf7197c329fcb3ead37e710d1bca9da5d583f5073b799d5c5bd1eee4 \
-    --hash=sha256:85a950a4ac9c359340d5963966e3e0a94a676bd6245a4b55bc43949eee26a655 \
-    --hash=sha256:8f2cdc858323644ab277e9bb925ad72ae0e67f69e804f4898c070998d50b1a67 \
-    --hash=sha256:9755e4345d1ec879e3849e62222a18c7174d65a6a92d5b346b1863912168b595 \
-    --hash=sha256:98e3969bcff97cae1b2def8ba499ea3d6f31ddfdb7635374834cf89a1a08ecf0 \
-    --hash=sha256:a08d7e755f8ed21095a310a693525137cfe756ce62d066e53f502a83dc550f65 \
-    --hash=sha256:a1ed2dd2972641495a3ec98445e09766f077aee98a1c896dcb4ad0d303628e41 \
-    --hash=sha256:a24ed04c8ffd54b0729c07cee15a81d964e6fee0e3d4d342a27b020d22959dc6 \
-    --hash=sha256:a45e3c6913c5b87b3ff120dcdc03f6131fa0065027d0ed7ee6190736a74cd401 \
-    --hash=sha256:a9b15d491f3ad5d692e11f6b71f7857e7835eb677955c00cc0aefcd0669adaf6 \
-    --hash=sha256:ad9413ccdeda48c5afdae7e4fa2192157e991ff761e7ab8fdd8926f40b160cc3 \
-    --hash=sha256:b2ab587605f4ba0bf81dc0cb08a41bd1c0a5906bd59243d56bad7668a6fc6c16 \
-    --hash=sha256:b62ce867176a75d03a665bad002af8e6d54644fad99a3c70905c543130e39d93 \
-    --hash=sha256:c03e868a0b3bc35839ba98e74211ed2b05d2119be4e8a0f224fba9384f1fe02e \
-    --hash=sha256:c59d6e989d07460165cc5ad3c61f9fd8f1b4796eacbd81cee78957842b834af4 \
-    --hash=sha256:c7eac2ef9b63c79431bc4b25f1cd649d7f061a28808cbc6c47b534bd789ef964 \
-    --hash=sha256:c9c3d058ebabb74db66e431095118094d06abf53284d9c81f27300d0e0d8bc7c \
-    --hash=sha256:ca74b8dbe6e8e8263c0ffd60277de77dcee6c837a3d0881d8c1ead7268c9e576 \
-    --hash=sha256:caaf0640ef5f5517f49bc275eca1406b0ffa6aa184892812030f04c2abf589a0 \
-    --hash=sha256:cdf5ce3acdfd1661132f2a9c19cac174758dc2352bfe37d98aa7512c6b7178b3 \
-    --hash=sha256:d016c76bdd850f3c626af19b0542c9677ba156e4ee4fccfdd7848803533ef662 \
-    --hash=sha256:d01b12eeeb4427d3110de311e1774046ad344f5b1a7403101878976ecd7a10f3 \
-    --hash=sha256:d63afe322132c194cf832bfec0dc69a99fb9bb6bbd550f161a49e9e855cc78ff \
-    --hash=sha256:da95af8214998d77a98cc14e3a3bd00aa191526343078b530ceb0bd710fb48a5 \
-    --hash=sha256:dd398dbc6773384a17fe0d3e7eeb8d1a21c2200473ee6806bb5e6a8e62bb73dd \
-    --hash=sha256:de2ea4b5833625383e464549fec1bc395c1bdeeb5f25c4a3a82b5a8c756ec22f \
-    --hash=sha256:de55b766c7aa2e2a3092c51e0483d700341182f08e67c63630d5b6f200bb28e5 \
-    --hash=sha256:df8b1c11f177bc2313ec4b2d46baec87a5f3e71fc8b45dab2ee7cae86d9aba14 \
-    --hash=sha256:e03eab0a8677fa80d646b5ddece1cbeaf556c313dcfac435ba11f107ba117b5d \
-    --hash=sha256:e221cf152cff04059d011ee126477f0d9588303eb57e88923578ace7baad17f9 \
-    --hash=sha256:e31ae45bc2e29f6b2abd0de1cc3b9d5205aa847cafaecb8af1476a609a2f6eb7 \
-    --hash=sha256:edae79245293e15384b51f88b00613ba9f7198016a5948b5dddf4917d4d26382 \
-    --hash=sha256:f1e22e8c4419538cb197e4dd60acc919d7696e5ef98ee4da4e01d3f8cfa4cc5a \
-    --hash=sha256:f3a2b4222ce6b60e2e8b337bb9596923045681d71e5a082783484d845390938e \
-    --hash=sha256:f6a16c31041f09ead72d69f583767292f750d24913dadacf5756b966aacb3f1a \
-    --hash=sha256:f75c7ab1f9e4aca5414ed4d8e5c0e303a34f4421f8a0d47a4d019ceff0ab6af4 \
-    --hash=sha256:f79fc4fc25f1c8698ff97788206bb3c2598949bfe0fef03d299eb1b5356ada99 \
-    --hash=sha256:f7f5baafcc48261359e14bcd6d9bff6d4b28d9103847c9e136694cb0501aef87 \
-    --hash=sha256:fc48c783f9c87e60831201f2cce7f3b2e4846bf4d8728eabe54d60700b318a0b
+cffi==2.0.0 \
+    --hash=sha256:00bdf7acc5f795150faa6957054fbbca2439db2f775ce831222b66f192f03beb \
+    --hash=sha256:07b271772c100085dd28b74fa0cd81c8fb1a3ba18b21e03d7c27f3436a10606b \
+    --hash=sha256:087067fa8953339c723661eda6b54bc98c5625757ea62e95eb4898ad5e776e9f \
+    --hash=sha256:0a1527a803f0a659de1af2e1fd700213caba79377e27e4693648c2923da066f9 \
+    --hash=sha256:0cf2d91ecc3fcc0625c2c530fe004f82c110405f101548512cce44322fa8ac44 \
+    --hash=sha256:0f6084a0ea23d05d20c3edcda20c3d006f9b6f3fefeac38f59262e10cef47ee2 \
+    --hash=sha256:12873ca6cb9b0f0d3a0da705d6086fe911591737a59f28b7936bdfed27c0d47c \
+    --hash=sha256:19f705ada2530c1167abacb171925dd886168931e0a7b78f5bffcae5c6b5be75 \
+    --hash=sha256:1cd13c99ce269b3ed80b417dcd591415d3372bcac067009b6e0f59c7d4015e65 \
+    --hash=sha256:1e3a615586f05fc4065a8b22b8152f0c1b00cdbc60596d187c2a74f9e3036e4e \
+    --hash=sha256:1f72fb8906754ac8a2cc3f9f5aaa298070652a0ffae577e0ea9bd480dc3c931a \
+    --hash=sha256:1fc9ea04857caf665289b7a75923f2c6ed559b8298a1b8c49e59f7dd95c8481e \
+    --hash=sha256:203a48d1fb583fc7d78a4c6655692963b860a417c0528492a6bc21f1aaefab25 \
+    --hash=sha256:2081580ebb843f759b9f617314a24ed5738c51d2aee65d31e02f6f7a2b97707a \
+    --hash=sha256:21d1152871b019407d8ac3985f6775c079416c282e431a4da6afe7aefd2bccbe \
+    --hash=sha256:24b6f81f1983e6df8db3adc38562c83f7d4a0c36162885ec7f7b77c7dcbec97b \
+    --hash=sha256:256f80b80ca3853f90c21b23ee78cd008713787b1b1e93eae9f3d6a7134abd91 \
+    --hash=sha256:28a3a209b96630bca57cce802da70c266eb08c6e97e5afd61a75611ee6c64592 \
+    --hash=sha256:2c8f814d84194c9ea681642fd164267891702542f028a15fc97d4674b6206187 \
+    --hash=sha256:2de9a304e27f7596cd03d16f1b7c72219bd944e99cc52b84d0145aefb07cbd3c \
+    --hash=sha256:38100abb9d1b1435bc4cc340bb4489635dc2f0da7456590877030c9b3d40b0c1 \
+    --hash=sha256:3925dd22fa2b7699ed2617149842d2e6adde22b262fcbfada50e3d195e4b3a94 \
+    --hash=sha256:3e17ed538242334bf70832644a32a7aae3d83b57567f9fd60a26257e992b79ba \
+    --hash=sha256:3e837e369566884707ddaf85fc1744b47575005c0a229de3327f8f9a20f4efeb \
+    --hash=sha256:3f4d46d8b35698056ec29bca21546e1551a205058ae1a181d871e278b0b28165 \
+    --hash=sha256:44d1b5909021139fe36001ae048dbdde8214afa20200eda0f64c068cac5d5529 \
+    --hash=sha256:45d5e886156860dc35862657e1494b9bae8dfa63bf56796f2fb56e1679fc0bca \
+    --hash=sha256:4647afc2f90d1ddd33441e5b0e85b16b12ddec4fca55f0d9671fef036ecca27c \
+    --hash=sha256:4671d9dd5ec934cb9a73e7ee9676f9362aba54f7f34910956b84d727b0d73fb6 \
+    --hash=sha256:53f77cbe57044e88bbd5ed26ac1d0514d2acf0591dd6bb02a3ae37f76811b80c \
+    --hash=sha256:5eda85d6d1879e692d546a078b44251cdd08dd1cfb98dfb77b670c97cee49ea0 \
+    --hash=sha256:5fed36fccc0612a53f1d4d9a816b50a36702c28a2aa880cb8a122b3466638743 \
+    --hash=sha256:61d028e90346df14fedc3d1e5441df818d095f3b87d286825dfcbd6459b7ef63 \
+    --hash=sha256:66f011380d0e49ed280c789fbd08ff0d40968ee7b665575489afa95c98196ab5 \
+    --hash=sha256:6824f87845e3396029f3820c206e459ccc91760e8fa24422f8b0c3d1731cbec5 \
+    --hash=sha256:6c6c373cfc5c83a975506110d17457138c8c63016b563cc9ed6e056a82f13ce4 \
+    --hash=sha256:6d02d6655b0e54f54c4ef0b94eb6be0607b70853c45ce98bd278dc7de718be5d \
+    --hash=sha256:6d50360be4546678fc1b79ffe7a66265e28667840010348dd69a314145807a1b \
+    --hash=sha256:730cacb21e1bdff3ce90babf007d0a0917cc3e6492f336c2f0134101e0944f93 \
+    --hash=sha256:737fe7d37e1a1bffe70bd5754ea763a62a066dc5913ca57e957824b72a85e205 \
+    --hash=sha256:74a03b9698e198d47562765773b4a8309919089150a0bb17d829ad7b44b60d27 \
+    --hash=sha256:7553fb2090d71822f02c629afe6042c299edf91ba1bf94951165613553984512 \
+    --hash=sha256:7a66c7204d8869299919db4d5069a82f1561581af12b11b3c9f48c584eb8743d \
+    --hash=sha256:7cc09976e8b56f8cebd752f7113ad07752461f48a58cbba644139015ac24954c \
+    --hash=sha256:81afed14892743bbe14dacb9e36d9e0e504cd204e0b165062c488942b9718037 \
+    --hash=sha256:8941aaadaf67246224cee8c3803777eed332a19d909b47e29c9842ef1e79ac26 \
+    --hash=sha256:89472c9762729b5ae1ad974b777416bfda4ac5642423fa93bd57a09204712322 \
+    --hash=sha256:8ea985900c5c95ce9db1745f7933eeef5d314f0565b27625d9a10ec9881e1bfb \
+    --hash=sha256:8eca2a813c1cb7ad4fb74d368c2ffbbb4789d377ee5bb8df98373c2cc0dee76c \
+    --hash=sha256:92b68146a71df78564e4ef48af17551a5ddd142e5190cdf2c5624d0c3ff5b2e8 \
+    --hash=sha256:9332088d75dc3241c702d852d4671613136d90fa6881da7d770a483fd05248b4 \
+    --hash=sha256:94698a9c5f91f9d138526b48fe26a199609544591f859c870d477351dc7b2414 \
+    --hash=sha256:9a67fc9e8eb39039280526379fb3a70023d77caec1852002b4da7e8b270c4dd9 \
+    --hash=sha256:9de40a7b0323d889cf8d23d1ef214f565ab154443c42737dfe52ff82cf857664 \
+    --hash=sha256:a05d0c237b3349096d3981b727493e22147f934b20f6f125a3eba8f994bec4a9 \
+    --hash=sha256:afb8db5439b81cf9c9d0c80404b60c3cc9c3add93e114dcae767f1477cb53775 \
+    --hash=sha256:b18a3ed7d5b3bd8d9ef7a8cb226502c6bf8308df1525e1cc676c3680e7176739 \
+    --hash=sha256:b1e74d11748e7e98e2f426ab176d4ed720a64412b6a15054378afdb71e0f37dc \
+    --hash=sha256:b21e08af67b8a103c71a250401c78d5e0893beff75e28c53c98f4de42f774062 \
+    --hash=sha256:b4c854ef3adc177950a8dfc81a86f5115d2abd545751a304c5bcf2c2c7283cfe \
+    --hash=sha256:b882b3df248017dba09d6b16defe9b5c407fe32fc7c65a9c69798e6175601be9 \
+    --hash=sha256:baf5215e0ab74c16e2dd324e8ec067ef59e41125d3eade2b863d294fd5035c92 \
+    --hash=sha256:c649e3a33450ec82378822b3dad03cc228b8f5963c0c12fc3b1e0ab940f768a5 \
+    --hash=sha256:c654de545946e0db659b3400168c9ad31b5d29593291482c43e3564effbcee13 \
+    --hash=sha256:c6638687455baf640e37344fe26d37c404db8b80d037c3d29f58fe8d1c3b194d \
+    --hash=sha256:c8d3b5532fc71b7a77c09192b4a5a200ea992702734a2e9279a37f2478236f26 \
+    --hash=sha256:cb527a79772e5ef98fb1d700678fe031e353e765d1ca2d409c92263c6d43e09f \
+    --hash=sha256:cf364028c016c03078a23b503f02058f1814320a56ad535686f90565636a9495 \
+    --hash=sha256:d48a880098c96020b02d5a1f7d9251308510ce8858940e6fa99ece33f610838b \
+    --hash=sha256:d68b6cef7827e8641e8ef16f4494edda8b36104d79773a334beaa1e3521430f6 \
+    --hash=sha256:d9b29c1f0ae438d5ee9acb31cadee00a58c46cc9c0b2f9038c6b0b3470877a8c \
+    --hash=sha256:d9b97165e8aed9272a6bb17c01e3cc5871a594a446ebedc996e2397a1c1ea8ef \
+    --hash=sha256:da68248800ad6320861f129cd9c1bf96ca849a2771a59e0344e88681905916f5 \
+    --hash=sha256:da902562c3e9c550df360bfa53c035b2f241fed6d9aef119048073680ace4a18 \
+    --hash=sha256:dbd5c7a25a7cb98f5ca55d258b103a2054f859a46ae11aaf23134f9cc0d356ad \
+    --hash=sha256:dd4f05f54a52fb558f1ba9f528228066954fee3ebe629fc1660d874d040ae5a3 \
+    --hash=sha256:de8dad4425a6ca6e4e5e297b27b5c824ecc7581910bf9aee86cb6835e6812aa7 \
+    --hash=sha256:e11e82b744887154b182fd3e7e8512418446501191994dbf9c9fc1f32cc8efd5 \
+    --hash=sha256:e6e73b9e02893c764e7e8d5bb5ce277f1a009cd5243f8228f75f842bf937c534 \
+    --hash=sha256:f73b96c41e3b2adedc34a7356e64c8eb96e03a3782b535e043a986276ce12a49 \
+    --hash=sha256:f93fd8e5c8c0a4aa1f424d6173f14a892044054871c771f8566e4008eaa359d2 \
+    --hash=sha256:fc33c5141b55ed366cfaad382df24fe7dcbc686de5be719b207bb248e3053dc5 \
+    --hash=sha256:fc7de24befaeae77ba923797c7c87834c73648a05a4bde34b3b7e5588973a453 \
+    --hash=sha256:fe562eb1a64e67dd297ccc4f5addea2501664954f2692b69a76449ec7913ecbf
     # via pynacl
-charset-normalizer==3.4.2 \
-    --hash=sha256:005fa3432484527f9732ebd315da8da8001593e2cf46a3d817669f062c3d9ed4 \
-    --hash=sha256:046595208aae0120559a67693ecc65dd75d46f7bf687f159127046628178dc45 \
-    --hash=sha256:0c29de6a1a95f24b9a1aa7aefd27d2487263f00dfd55a77719b530788f75cff7 \
-    --hash=sha256:0c8c57f84ccfc871a48a47321cfa49ae1df56cd1d965a09abe84066f6853b9c0 \
-    --hash=sha256:0f5d9ed7f254402c9e7d35d2f5972c9bbea9040e99cd2861bd77dc68263277c7 \
-    --hash=sha256:18dd2e350387c87dabe711b86f83c9c78af772c748904d372ade190b5c7c9d4d \
-    --hash=sha256:1b1bde144d98e446b056ef98e59c256e9294f6b74d7af6846bf5ffdafd687a7d \
-    --hash=sha256:1c95a1e2902a8b722868587c0e1184ad5c55631de5afc0eb96bc4b0d738092c0 \
-    --hash=sha256:1cad5f45b3146325bb38d6855642f6fd609c3f7cad4dbaf75549bf3b904d3184 \
-    --hash=sha256:21b2899062867b0e1fde9b724f8aecb1af14f2778d69aacd1a5a1853a597a5db \
-    --hash=sha256:24498ba8ed6c2e0b56d4acbf83f2d989720a93b41d712ebd4f4979660db4417b \
-    --hash=sha256:25a23ea5c7edc53e0f29bae2c44fcb5a1aa10591aae107f2a2b2583a9c5cbc64 \
-    --hash=sha256:289200a18fa698949d2b39c671c2cc7a24d44096784e76614899a7ccf2574b7b \
-    --hash=sha256:28a1005facc94196e1fb3e82a3d442a9d9110b8434fc1ded7a24a2983c9888d8 \
-    --hash=sha256:32fc0341d72e0f73f80acb0a2c94216bd704f4f0bce10aedea38f30502b271ff \
-    --hash=sha256:36b31da18b8890a76ec181c3cf44326bf2c48e36d393ca1b72b3f484113ea344 \
-    --hash=sha256:3c21d4fca343c805a52c0c78edc01e3477f6dd1ad7c47653241cf2a206d4fc58 \
-    --hash=sha256:3fddb7e2c84ac87ac3a947cb4e66d143ca5863ef48e4a5ecb83bd48619e4634e \
-    --hash=sha256:43e0933a0eff183ee85833f341ec567c0980dae57c464d8a508e1b2ceb336471 \
-    --hash=sha256:4a476b06fbcf359ad25d34a057b7219281286ae2477cc5ff5e3f70a246971148 \
-    --hash=sha256:4e594135de17ab3866138f496755f302b72157d115086d100c3f19370839dd3a \
-    --hash=sha256:50bf98d5e563b83cc29471fa114366e6806bc06bc7a25fd59641e41445327836 \
-    --hash=sha256:5a9979887252a82fefd3d3ed2a8e3b937a7a809f65dcb1e068b090e165bbe99e \
-    --hash=sha256:5baececa9ecba31eff645232d59845c07aa030f0c81ee70184a90d35099a0e63 \
-    --hash=sha256:5bf4545e3b962767e5c06fe1738f951f77d27967cb2caa64c28be7c4563e162c \
-    --hash=sha256:6333b3aa5a12c26b2a4d4e7335a28f1475e0e5e17d69d55141ee3cab736f66d1 \
-    --hash=sha256:65c981bdbd3f57670af8b59777cbfae75364b483fa8a9f420f08094531d54a01 \
-    --hash=sha256:68a328e5f55ec37c57f19ebb1fdc56a248db2e3e9ad769919a58672958e8f366 \
-    --hash=sha256:6a0289e4589e8bdfef02a80478f1dfcb14f0ab696b5a00e1f4b8a14a307a3c58 \
-    --hash=sha256:6b66f92b17849b85cad91259efc341dce9c1af48e2173bf38a85c6329f1033e5 \
-    --hash=sha256:6c9379d65defcab82d07b2a9dfbfc2e95bc8fe0ebb1b176a3190230a3ef0e07c \
-    --hash=sha256:6fc1f5b51fa4cecaa18f2bd7a003f3dd039dd615cd69a2afd6d3b19aed6775f2 \
-    --hash=sha256:70f7172939fdf8790425ba31915bfbe8335030f05b9913d7ae00a87d4395620a \
-    --hash=sha256:721c76e84fe669be19c5791da68232ca2e05ba5185575086e384352e2c309597 \
-    --hash=sha256:7222ffd5e4de8e57e03ce2cef95a4c43c98fcb72ad86909abdfc2c17d227fc1b \
-    --hash=sha256:75d10d37a47afee94919c4fab4c22b9bc2a8bf7d4f46f87363bcf0573f3ff4f5 \
-    --hash=sha256:76af085e67e56c8816c3ccf256ebd136def2ed9654525348cfa744b6802b69eb \
-    --hash=sha256:770cab594ecf99ae64c236bc9ee3439c3f46be49796e265ce0cc8bc17b10294f \
-    --hash=sha256:7a6ab32f7210554a96cd9e33abe3ddd86732beeafc7a28e9955cdf22ffadbab0 \
-    --hash=sha256:7c48ed483eb946e6c04ccbe02c6b4d1d48e51944b6db70f697e089c193404941 \
-    --hash=sha256:7f56930ab0abd1c45cd15be65cc741c28b1c9a34876ce8c17a2fa107810c0af0 \
-    --hash=sha256:8075c35cd58273fee266c58c0c9b670947c19df5fb98e7b66710e04ad4e9ff86 \
-    --hash=sha256:8272b73e1c5603666618805fe821edba66892e2870058c94c53147602eab29c7 \
-    --hash=sha256:82d8fd25b7f4675d0c47cf95b594d4e7b158aca33b76aa63d07186e13c0e0ab7 \
-    --hash=sha256:844da2b5728b5ce0e32d863af26f32b5ce61bc4273a9c720a9f3aa9df73b1455 \
-    --hash=sha256:8755483f3c00d6c9a77f490c17e6ab0c8729e39e6390328e42521ef175380ae6 \
-    --hash=sha256:915f3849a011c1f593ab99092f3cecfcb4d65d8feb4a64cf1bf2d22074dc0ec4 \
-    --hash=sha256:926ca93accd5d36ccdabd803392ddc3e03e6d4cd1cf17deff3b989ab8e9dbcf0 \
-    --hash=sha256:982bb1e8b4ffda883b3d0a521e23abcd6fd17418f6d2c4118d257a10199c0ce3 \
-    --hash=sha256:98f862da73774290f251b9df8d11161b6cf25b599a66baf087c1ffe340e9bfd1 \
-    --hash=sha256:9cbfacf36cb0ec2897ce0ebc5d08ca44213af24265bd56eca54bee7923c48fd6 \
-    --hash=sha256:a370b3e078e418187da8c3674eddb9d983ec09445c99a3a263c2011993522981 \
-    --hash=sha256:a955b438e62efdf7e0b7b52a64dc5c3396e2634baa62471768a64bc2adb73d5c \
-    --hash=sha256:aa6af9e7d59f9c12b33ae4e9450619cf2488e2bbe9b44030905877f0b2324980 \
-    --hash=sha256:aa88ca0b1932e93f2d961bf3addbb2db902198dca337d88c89e1559e066e7645 \
-    --hash=sha256:aaeeb6a479c7667fbe1099af9617c83aaca22182d6cf8c53966491a0f1b7ffb7 \
-    --hash=sha256:aaf27faa992bfee0264dc1f03f4c75e9fcdda66a519db6b957a3f826e285cf12 \
-    --hash=sha256:b2680962a4848b3c4f155dc2ee64505a9c57186d0d56b43123b17ca3de18f0fa \
-    --hash=sha256:b2d318c11350e10662026ad0eb71bb51c7812fc8590825304ae0bdd4ac283acd \
-    --hash=sha256:b33de11b92e9f75a2b545d6e9b6f37e398d86c3e9e9653c4864eb7e89c5773ef \
-    --hash=sha256:b3daeac64d5b371dea99714f08ffc2c208522ec6b06fbc7866a450dd446f5c0f \
-    --hash=sha256:be1e352acbe3c78727a16a455126d9ff83ea2dfdcbc83148d2982305a04714c2 \
-    --hash=sha256:bee093bf902e1d8fc0ac143c88902c3dfc8941f7ea1d6a8dd2bcb786d33db03d \
-    --hash=sha256:c72fbbe68c6f32f251bdc08b8611c7b3060612236e960ef848e0a517ddbe76c5 \
-    --hash=sha256:c9e36a97bee9b86ef9a1cf7bb96747eb7a15c2f22bdb5b516434b00f2a599f02 \
-    --hash=sha256:cddf7bd982eaa998934a91f69d182aec997c6c468898efe6679af88283b498d3 \
-    --hash=sha256:cf713fe9a71ef6fd5adf7a79670135081cd4431c2943864757f0fa3a65b1fafd \
-    --hash=sha256:d11b54acf878eef558599658b0ffca78138c8c3655cf4f3a4a673c437e67732e \
-    --hash=sha256:d41c4d287cfc69060fa91cae9683eacffad989f1a10811995fa309df656ec214 \
-    --hash=sha256:d524ba3f1581b35c03cb42beebab4a13e6cdad7b36246bd22541fa585a56cccd \
-    --hash=sha256:daac4765328a919a805fa5e2720f3e94767abd632ae410a9062dff5412bae65a \
-    --hash=sha256:db4c7bf0e07fc3b7d89ac2a5880a6a8062056801b83ff56d8464b70f65482b6c \
-    --hash=sha256:dc7039885fa1baf9be153a0626e337aa7ec8bf96b0128605fb0d77788ddc1681 \
-    --hash=sha256:dccab8d5fa1ef9bfba0590ecf4d46df048d18ffe3eec01eeb73a42e0d9e7a8ba \
-    --hash=sha256:dedb8adb91d11846ee08bec4c8236c8549ac721c245678282dcb06b221aab59f \
-    --hash=sha256:e45ba65510e2647721e35323d6ef54c7974959f6081b58d4ef5d87c60c84919a \
-    --hash=sha256:e53efc7c7cee4c1e70661e2e112ca46a575f90ed9ae3fef200f2a25e954f4b28 \
-    --hash=sha256:e635b87f01ebc977342e2697d05b56632f5f879a4f15955dfe8cef2448b51691 \
-    --hash=sha256:e70e990b2137b29dc5564715de1e12701815dacc1d056308e2b17e9095372a82 \
-    --hash=sha256:e8082b26888e2f8b36a042a58307d5b917ef2b1cacab921ad3323ef91901c71a \
-    --hash=sha256:e8323a9b031aa0393768b87f04b4164a40037fb2a3c11ac06a03ffecd3618027 \
-    --hash=sha256:e92fca20c46e9f5e1bb485887d074918b13543b1c2a1185e69bb8d17ab6236a7 \
-    --hash=sha256:eb30abc20df9ab0814b5a2524f23d75dcf83cde762c161917a2b4b7b55b1e518 \
-    --hash=sha256:eba9904b0f38a143592d9fc0e19e2df0fa2e41c3c3745554761c5f6447eedabf \
-    --hash=sha256:ef8de666d6179b009dce7bcb2ad4c4a779f113f12caf8dc77f0162c29d20490b \
-    --hash=sha256:efd387a49825780ff861998cd959767800d54f8308936b21025326de4b5a42b9 \
-    --hash=sha256:f0aa37f3c979cf2546b73e8222bbfa3dc07a641585340179d768068e3455e544 \
-    --hash=sha256:f4074c5a429281bf056ddd4c5d3b740ebca4d43ffffe2ef4bf4d2d05114299da \
-    --hash=sha256:f69a27e45c43520f5487f27627059b64aaf160415589230992cec34c5e18a509 \
-    --hash=sha256:fb707f3e15060adf5b7ada797624a6c6e0138e2a26baa089df64c68ee98e040f \
-    --hash=sha256:fcbe676a55d7445b22c10967bceaaf0ee69407fbe0ece4d032b6eb8d4565982a \
-    --hash=sha256:fdb20a30fe1175ecabed17cbf7812f7b804b8a315a25f24678bcdf120a90077f
+charset-normalizer==3.4.4 \
+    --hash=sha256:027f6de494925c0ab2a55eab46ae5129951638a49a34d87f4c3eda90f696b4ad \
+    --hash=sha256:077fbb858e903c73f6c9db43374fd213b0b6a778106bc7032446a8e8b5b38b93 \
+    --hash=sha256:0a98e6759f854bd25a58a73fa88833fba3b7c491169f86ce1180c948ab3fd394 \
+    --hash=sha256:0d3d8f15c07f86e9ff82319b3d9ef6f4bf907608f53fe9d92b28ea9ae3d1fd89 \
+    --hash=sha256:0f04b14ffe5fdc8c4933862d8306109a2c51e0704acfa35d51598eb45a1e89fc \
+    --hash=sha256:11d694519d7f29d6cd09f6ac70028dba10f92f6cdd059096db198c283794ac86 \
+    --hash=sha256:194f08cbb32dc406d6e1aea671a68be0823673db2832b38405deba2fb0d88f63 \
+    --hash=sha256:1bee1e43c28aa63cb16e5c14e582580546b08e535299b8b6158a7c9c768a1f3d \
+    --hash=sha256:21d142cc6c0ec30d2efee5068ca36c128a30b0f2c53c1c07bd78cb6bc1d3be5f \
+    --hash=sha256:2437418e20515acec67d86e12bf70056a33abdacb5cb1655042f6538d6b085a8 \
+    --hash=sha256:244bfb999c71b35de57821b8ea746b24e863398194a4014e4c76adc2bbdfeff0 \
+    --hash=sha256:2677acec1a2f8ef614c6888b5b4ae4060cc184174a938ed4e8ef690e15d3e505 \
+    --hash=sha256:277e970e750505ed74c832b4bf75dac7476262ee2a013f5574dd49075879e161 \
+    --hash=sha256:2aaba3b0819274cc41757a1da876f810a3e4d7b6eb25699253a4effef9e8e4af \
+    --hash=sha256:2b7d8f6c26245217bd2ad053761201e9f9680f8ce52f0fcd8d0755aeae5b2152 \
+    --hash=sha256:2c9d3c380143a1fedbff95a312aa798578371eb29da42106a29019368a475318 \
+    --hash=sha256:3162d5d8ce1bb98dd51af660f2121c55d0fa541b46dff7bb9b9f86ea1d87de72 \
+    --hash=sha256:31fd66405eaf47bb62e8cd575dc621c56c668f27d46a61d975a249930dd5e2a4 \
+    --hash=sha256:362d61fd13843997c1c446760ef36f240cf81d3ebf74ac62652aebaf7838561e \
+    --hash=sha256:376bec83a63b8021bb5c8ea75e21c4ccb86e7e45ca4eb81146091b56599b80c3 \
+    --hash=sha256:44c2a8734b333e0578090c4cd6b16f275e07aa6614ca8715e6c038e865e70576 \
+    --hash=sha256:47cc91b2f4dd2833fddaedd2893006b0106129d4b94fdb6af1f4ce5a9965577c \
+    --hash=sha256:4902828217069c3c5c71094537a8e623f5d097858ac6ca8252f7b4d10b7560f1 \
+    --hash=sha256:4bd5d4137d500351a30687c2d3971758aac9a19208fc110ccb9d7188fbe709e8 \
+    --hash=sha256:4fe7859a4e3e8457458e2ff592f15ccb02f3da787fcd31e0183879c3ad4692a1 \
+    --hash=sha256:542d2cee80be6f80247095cc36c418f7bddd14f4a6de45af91dfad36d817bba2 \
+    --hash=sha256:554af85e960429cf30784dd47447d5125aaa3b99a6f0683589dbd27e2f45da44 \
+    --hash=sha256:5833d2c39d8896e4e19b689ffc198f08ea58116bee26dea51e362ecc7cd3ed26 \
+    --hash=sha256:5947809c8a2417be3267efc979c47d76a079758166f7d43ef5ae8e9f92751f88 \
+    --hash=sha256:5ae497466c7901d54b639cf42d5b8c1b6a4fead55215500d2f486d34db48d016 \
+    --hash=sha256:5bd2293095d766545ec1a8f612559f6b40abc0eb18bb2f5d1171872d34036ede \
+    --hash=sha256:5bfbb1b9acf3334612667b61bd3002196fe2a1eb4dd74d247e0f2a4d50ec9bbf \
+    --hash=sha256:5cb4d72eea50c8868f5288b7f7f33ed276118325c1dfd3957089f6b519e1382a \
+    --hash=sha256:5dbe56a36425d26d6cfb40ce79c314a2e4dd6211d51d6d2191c00bed34f354cc \
+    --hash=sha256:5f819d5fe9234f9f82d75bdfa9aef3a3d72c4d24a6e57aeaebba32a704553aa0 \
+    --hash=sha256:64b55f9dce520635f018f907ff1b0df1fdc31f2795a922fb49dd14fbcdf48c84 \
+    --hash=sha256:6515f3182dbe4ea06ced2d9e8666d97b46ef4c75e326b79bb624110f122551db \
+    --hash=sha256:65e2befcd84bc6f37095f5961e68a6f077bf44946771354a28ad434c2cce0ae1 \
+    --hash=sha256:6aee717dcfead04c6eb1ce3bd29ac1e22663cdea57f943c87d1eab9a025438d7 \
+    --hash=sha256:6b39f987ae8ccdf0d2642338faf2abb1862340facc796048b604ef14919e55ed \
+    --hash=sha256:6e1fcf0720908f200cd21aa4e6750a48ff6ce4afe7ff5a79a90d5ed8a08296f8 \
+    --hash=sha256:74018750915ee7ad843a774364e13a3db91682f26142baddf775342c3f5b1133 \
+    --hash=sha256:74664978bb272435107de04e36db5a9735e78232b85b77d45cfb38f758efd33e \
+    --hash=sha256:74bb723680f9f7a6234dcf67aea57e708ec1fbdf5699fb91dfd6f511b0a320ef \
+    --hash=sha256:752944c7ffbfdd10c074dc58ec2d5a8a4cd9493b314d367c14d24c17684ddd14 \
+    --hash=sha256:778d2e08eda00f4256d7f672ca9fef386071c9202f5e4607920b86d7803387f2 \
+    --hash=sha256:780236ac706e66881f3b7f2f32dfe90507a09e67d1d454c762cf642e6e1586e0 \
+    --hash=sha256:798d75d81754988d2565bff1b97ba5a44411867c0cf32b77a7e8f8d84796b10d \
+    --hash=sha256:799a7a5e4fb2d5898c60b640fd4981d6a25f1c11790935a44ce38c54e985f828 \
+    --hash=sha256:7a32c560861a02ff789ad905a2fe94e3f840803362c84fecf1851cb4cf3dc37f \
+    --hash=sha256:7c308f7e26e4363d79df40ca5b2be1c6ba9f02bdbccfed5abddb7859a6ce72cf \
+    --hash=sha256:7fa17817dc5625de8a027cb8b26d9fefa3ea28c8253929b8d6649e705d2835b6 \
+    --hash=sha256:81d5eb2a312700f4ecaa977a8235b634ce853200e828fbadf3a9c50bab278328 \
+    --hash=sha256:82004af6c302b5d3ab2cfc4cc5f29db16123b1a8417f2e25f9066f91d4411090 \
+    --hash=sha256:837c2ce8c5a65a2035be9b3569c684358dfbf109fd3b6969630a87535495ceaa \
+    --hash=sha256:840c25fb618a231545cbab0564a799f101b63b9901f2569faecd6b222ac72381 \
+    --hash=sha256:8a6562c3700cce886c5be75ade4a5db4214fda19fede41d9792d100288d8f94c \
+    --hash=sha256:8af65f14dc14a79b924524b1e7fffe304517b2bff5a58bf64f30b98bbc5079eb \
+    --hash=sha256:8ef3c867360f88ac904fd3f5e1f902f13307af9052646963ee08ff4f131adafc \
+    --hash=sha256:94537985111c35f28720e43603b8e7b43a6ecfb2ce1d3058bbe955b73404e21a \
+    --hash=sha256:99ae2cffebb06e6c22bdc25801d7b30f503cc87dbd283479e7b606f70aff57ec \
+    --hash=sha256:9a26f18905b8dd5d685d6d07b0cdf98a79f3c7a918906af7cc143ea2e164c8bc \
+    --hash=sha256:9b35f4c90079ff2e2edc5b26c0c77925e5d2d255c42c74fdb70fb49b172726ac \
+    --hash=sha256:9cd98cdc06614a2f768d2b7286d66805f94c48cde050acdbbb7db2600ab3197e \
+    --hash=sha256:9d1bb833febdff5c8927f922386db610b49db6e0d4f4ee29601d71e7c2694313 \
+    --hash=sha256:9f7fcd74d410a36883701fafa2482a6af2ff5ba96b9a620e9e0721e28ead5569 \
+    --hash=sha256:a59cb51917aa591b1c4e6a43c132f0cdc3c76dbad6155df4e28ee626cc77a0a3 \
+    --hash=sha256:a61900df84c667873b292c3de315a786dd8dac506704dea57bc957bd31e22c7d \
+    --hash=sha256:a79cfe37875f822425b89a82333404539ae63dbdddf97f84dcbc3d339aae9525 \
+    --hash=sha256:a8a8b89589086a25749f471e6a900d3f662d1d3b6e2e59dcecf787b1cc3a1894 \
+    --hash=sha256:a8bf8d0f749c5757af2142fe7903a9df1d2e8aa3841559b2bad34b08d0e2bcf3 \
+    --hash=sha256:a9768c477b9d7bd54bc0c86dbaebdec6f03306675526c9927c0e8a04e8f94af9 \
+    --hash=sha256:ac1c4a689edcc530fc9d9aa11f5774b9e2f33f9a0c6a57864e90908f5208d30a \
+    --hash=sha256:af2d8c67d8e573d6de5bc30cdb27e9b95e49115cd9baad5ddbd1a6207aaa82a9 \
+    --hash=sha256:b435cba5f4f750aa6c0a0d92c541fb79f69a387c91e61f1795227e4ed9cece14 \
+    --hash=sha256:b5b290ccc2a263e8d185130284f8501e3e36c5e02750fc6b6bdeb2e9e96f1e25 \
+    --hash=sha256:b5d84d37db046c5ca74ee7bb47dd6cbc13f80665fdde3e8040bdd3fb015ecb50 \
+    --hash=sha256:b7cf1017d601aa35e6bb650b6ad28652c9cd78ee6caff19f3c28d03e1c80acbf \
+    --hash=sha256:bc7637e2f80d8530ee4a78e878bce464f70087ce73cf7c1caf142416923b98f1 \
+    --hash=sha256:c0463276121fdee9c49b98908b3a89c39be45d86d1dbaa22957e38f6321d4ce3 \
+    --hash=sha256:c4ef880e27901b6cc782f1b95f82da9313c0eb95c3af699103088fa0ac3ce9ac \
+    --hash=sha256:c8ae8a0f02f57a6e61203a31428fa1d677cbe50c93622b4149d5c0f319c1d19e \
+    --hash=sha256:ca5862d5b3928c4940729dacc329aa9102900382fea192fc5e52eb69d6093815 \
+    --hash=sha256:cb01158d8b88ee68f15949894ccc6712278243d95f344770fa7593fa2d94410c \
+    --hash=sha256:cb6254dc36b47a990e59e1068afacdcd02958bdcce30bb50cc1700a8b9d624a6 \
+    --hash=sha256:cc00f04ed596e9dc0da42ed17ac5e596c6ccba999ba6bd92b0e0aef2f170f2d6 \
+    --hash=sha256:cd09d08005f958f370f539f186d10aec3377d55b9eeb0d796025d4886119d76e \
+    --hash=sha256:cd4b7ca9984e5e7985c12bc60a6f173f3c958eae74f3ef6624bb6b26e2abbae4 \
+    --hash=sha256:ce8a0633f41a967713a59c4139d29110c07e826d131a316b50ce11b1d79b4f84 \
+    --hash=sha256:cead0978fc57397645f12578bfd2d5ea9138ea0fac82b2f63f7f7c6877986a69 \
+    --hash=sha256:d055ec1e26e441f6187acf818b73564e6e6282709e9bcb5b63f5b23068356a15 \
+    --hash=sha256:d1f13550535ad8cff21b8d757a3257963e951d96e20ec82ab44bc64aeb62a191 \
+    --hash=sha256:d9c7f57c3d666a53421049053eaacdd14bbd0a528e2186fcb2e672effd053bb0 \
+    --hash=sha256:d9e45d7faa48ee908174d8fe84854479ef838fc6a705c9315372eacbc2f02897 \
+    --hash=sha256:da3326d9e65ef63a817ecbcc0df6e94463713b754fe293eaa03da99befb9a5bd \
+    --hash=sha256:de00632ca48df9daf77a2c65a484531649261ec9f25489917f09e455cb09ddb2 \
+    --hash=sha256:e1f185f86a6f3403aa2420e815904c67b2f9ebc443f045edd0de921108345794 \
+    --hash=sha256:e824f1492727fa856dd6eda4f7cee25f8518a12f3c4a56a74e8095695089cf6d \
+    --hash=sha256:e912091979546adf63357d7e2ccff9b44f026c075aeaf25a52d0e95ad2281074 \
+    --hash=sha256:eaabd426fe94daf8fd157c32e571c85cb12e66692f15516a83a03264b08d06c3 \
+    --hash=sha256:ebf3e58c7ec8a8bed6d66a75d7fb37b55e5015b03ceae72a8e7c74495551e224 \
+    --hash=sha256:ecaae4149d99b1c9e7b88bb03e3221956f68fd6d50be2ef061b2381b61d20838 \
+    --hash=sha256:eecbc200c7fd5ddb9a7f16c7decb07b566c29fa2161a16cf67b8d068bd21690a \
+    --hash=sha256:f155a433c2ec037d4e8df17d18922c3a0d9b3232a396690f17175d2946f0218d \
+    --hash=sha256:f1e34719c6ed0b92f418c7c780480b26b5d9c50349e9a9af7d76bf757530350d \
+    --hash=sha256:f34be2938726fc13801220747472850852fe6b1ea75869a048d6f896838c896f \
+    --hash=sha256:f820802628d2694cb7e56db99213f930856014862f3fd943d290ea8438d07ca8 \
+    --hash=sha256:f8bf04158c6b607d747e93949aa60618b61312fe647a6369f88ce2ff16043490 \
+    --hash=sha256:f8e160feb2aed042cd657a72acc0b481212ed28b1b9a95c0cee1621b524e1966 \
+    --hash=sha256:f9d332f8c2a2fcbffe1378594431458ddbef721c1769d78e2cbc06280d8155f9 \
+    --hash=sha256:fa09f53c465e532f4d3db095e0c55b615f010ad81803d383195b6b5ca6cbf5f3 \
+    --hash=sha256:faa3a41b2b66b6e50f84ae4a68c64fcd0c44355741c6374813a800cd6695db9e \
+    --hash=sha256:fd44c878ea55ba351104cb93cc85e74916eb8fa440ca7903e57575e97394f608
     # via requests
 dkimpy==1.1.8 \
     --hash=sha256:b5f60fb47bbf5d8d762f134bcea0c388eba6b498342a682a21f1686545094b77
     # via b4 (pyproject.toml)
-dnspython==2.7.0 \
-    --hash=sha256:b4c34b7d10b51bcc3a5071e7b8dee77939f1e878477eeecc965e9835f63c6c86 \
-    --hash=sha256:ce9c432eda0dc91cf618a5cedf1a4e142651196bbcd2c80e89ed5a907e5cfaf1
+dnspython==2.8.0 \
+    --hash=sha256:01d9bbc4a2d76bf0db7c1f729812ded6d912bd318d3b1cf81d30c0f845dbf3af \
+    --hash=sha256:181d3c6996452cb1189c4046c61599b84a5a86e099562ffde77d26984ff26d0f
     # via dkimpy
 git-filter-repo==2.47.0 \
     --hash=sha256:2cd04929b9024e83e65db571cbe36aec65ead0cb5f9ec5abe42158654af5ad83 \
     --hash=sha256:411b27e68a080c07a69c233cb526dbc2d848b09a72f10477f4444dd0822cf290
     # via b4 (pyproject.toml)
-idna==3.10 \
-    --hash=sha256:12f65c9b470abda6dc35cf8e63cc574b1c52b11df2c86030af0ac09b01b13ea9 \
-    --hash=sha256:946d195a0d259cbba61165e88e65941f16e9b36ea6ddb97f00452bae8b1287d3
+idna==3.11 \
+    --hash=sha256:771a87f49d9defaf64091e6e6fe9c18d4833f140bd19464795bc32d966ca37ea \
+    --hash=sha256:795dafcc9c04ed0c1fb032c2aa73654d8e8c5023a7df64a53f39190ada629902
     # via requests
 patatt==0.6.3 \
     --hash=sha256:980826f6529d2576c267ca1f564d5bef046cb47e54215bb598ed6c4b9b2d0a28 \
     --hash=sha256:fd763660cb847aab623cbb9891240b6c10c39cc9bfca73cd3b03d40a5eb1c552
     # via b4 (pyproject.toml)
-pycparser==2.22 \
-    --hash=sha256:491c8be9c040f5390f5bf44a5b07752bd07f56edf992381b05c701439eec10f6 \
-    --hash=sha256:c3702b6d3dd8c7abc1afa565d7e63d53a1d0bd86cdc24edd75470f4de499cfcc
+pycparser==2.23 \
+    --hash=sha256:78816d4f24add8f10a06d6f05b4d424ad9e96cfebf68a4ddc99c65c0720d00c2 \
+    --hash=sha256:e5c6e8d3fbad53479cab09ac03729e0a9faf2bee3db8208a550daf5af81a5934
     # via cffi
-pynacl==1.5.0 \
-    --hash=sha256:06b8f6fa7f5de8d5d2f7573fe8c863c051225a27b61e6860fd047b1775807858 \
-    --hash=sha256:0c84947a22519e013607c9be43706dd42513f9e6ae5d39d3613ca1e142fba44d \
-    --hash=sha256:20f42270d27e1b6a29f54032090b972d97f0a1b0948cc52392041ef7831fee93 \
-    --hash=sha256:401002a4aaa07c9414132aaed7f6836ff98f59277a234704ff66878c2ee4a0d1 \
-    --hash=sha256:52cb72a79269189d4e0dc537556f4740f7f0a9ec41c1322598799b0bdad4ef92 \
-    --hash=sha256:61f642bf2378713e2c2e1de73444a3778e5f0a38be6fee0fe532fe30060282ff \
-    --hash=sha256:8ac7448f09ab85811607bdd21ec2464495ac8b7c66d146bf545b0f08fb9220ba \
-    --hash=sha256:a36d4a9dda1f19ce6e03c9a784a2921a4b726b02e1c736600ca9c22029474394 \
-    --hash=sha256:a422368fc821589c228f4c49438a368831cb5bbc0eab5ebe1d7fac9dded6567b \
-    --hash=sha256:e46dae94e34b085175f8abb3b0aaa7da40767865ac82c928eeb9e57e1ea8a543
+pynacl==1.6.1 \
+    --hash=sha256:262a8de6bba4aee8a66f5edf62c214b06647461c9b6b641f8cd0cb1e3b3196fe \
+    --hash=sha256:2b12f1b97346f177affcdfdc78875ff42637cb40dcf79484a97dae3448083a78 \
+    --hash=sha256:319de653ef84c4f04e045eb250e6101d23132372b0a61a7acf91bac0fda8e58c \
+    --hash=sha256:3206fa98737fdc66d59b8782cecc3d37d30aeec4593d1c8c145825a345bba0f0 \
+    --hash=sha256:3384a454adf5d716a9fadcb5eb2e3e72cd49302d1374a60edc531c9957a9b014 \
+    --hash=sha256:3cd787ec1f5c155dc8ecf39b1333cfef41415dc96d392f1ce288b4fe970df489 \
+    --hash=sha256:4ce50d19f1566c391fedc8dc2f2f5be265ae214112ebe55315e41d1f36a7f0a9 \
+    --hash=sha256:53543b4f3d8acb344f75fd4d49f75e6572fce139f4bfb4815a9282296ff9f4c0 \
+    --hash=sha256:543f869140f67d42b9b8d47f922552d7a967e6c116aad028c9bfc5f3f3b3a7b7 \
+    --hash=sha256:5953e8b8cfadb10889a6e7bd0f53041a745d1b3d30111386a1bb37af171e6daf \
+    --hash=sha256:5a3becafc1ee2e5ea7f9abc642f56b82dcf5be69b961e782a96ea52b55d8a9fc \
+    --hash=sha256:5f5b35c1a266f8a9ad22525049280a600b19edd1f785bccd01ae838437dcf935 \
+    --hash=sha256:6b35d93ab2df03ecb3aa506be0d3c73609a51449ae0855c2e89c7ed44abde40b \
+    --hash=sha256:7713f8977b5d25f54a811ec9efa2738ac592e846dd6e8a4d3f7578346a841078 \
+    --hash=sha256:7d7c09749450c385301a3c20dca967a525152ae4608c0a096fe8464bfc3df93d \
+    --hash=sha256:8d361dac0309f2b6ad33b349a56cd163c98430d409fa503b10b70b3ad66eaa1d \
+    --hash=sha256:9fd1a4eb03caf8a2fe27b515a998d26923adb9ddb68db78e35ca2875a3830dde \
+    --hash=sha256:a2bb472458c7ca959aeeff8401b8efef329b0fc44a89d3775cffe8fad3398ad8 \
+    --hash=sha256:a569a4069a7855f963940040f35e87d8bc084cb2d6347428d5ad20550a0a1a21 \
+    --hash=sha256:a6f9fd6d6639b1e81115c7f8ff16b8dedba1e8098d2756275d63d208b0e32021 \
+    --hash=sha256:c2228054f04bf32d558fb89bb99f163a8197d5a9bf4efa13069a7fa8d4b93fc3 \
+    --hash=sha256:d8615ee34d01c8e0ab3f302dcdd7b32e2bcf698ba5f4809e7cc407c8cdea7717 \
+    --hash=sha256:d984c91fe3494793b2a1fb1e91429539c6c28e9ec8209d26d25041ec599ccf63 \
+    --hash=sha256:dece79aecbb8f4640a1adbb81e4aa3bfb0e98e99834884a80eb3f33c7c30e708 \
+    --hash=sha256:e49a3f3d0da9f79c1bec2aa013261ab9fa651c7da045d376bd306cf7c1792993 \
+    --hash=sha256:e735c3a1bdfde3834503baf1a6d74d4a143920281cb724ba29fb84c9f49b9c48 \
+    --hash=sha256:fc734c1696ffd49b40f7c1779c89ba908157c57345cf626be2e0719488a076d3
     # via patatt
-requests==2.32.4 \
-    --hash=sha256:27babd3cda2a6d50b30443204ee89830707d396671944c998b5975b031ac2b2c \
-    --hash=sha256:27d0316682c8a29834d3264820024b62a36942083d52caf2f14c0591336d3422
+requests==2.32.5 \
+    --hash=sha256:2462f94637a34fd532264295e186976db0f5d453d1cdd31473c85a6a161affb6 \
+    --hash=sha256:dbba0bac56e100853db0ea71b82b4dfd5fe2bf6d3754a8893c3af500cec7d7cf
     # via b4 (pyproject.toml)
-urllib3==2.4.0 \
-    --hash=sha256:414bc6535b787febd7567804cc015fee39daab8ad86268f1310a9250697de466 \
-    --hash=sha256:4e16665048960a0900c702d4a66415956a584919c03361cac9f1df5c5dd7e813
+urllib3==2.5.0 \
+    --hash=sha256:3fc47733c7e419d4bc3f6b3dc2b4f890bb743906a30d56ba4a5bfa4bbff92760 \
+    --hash=sha256:e6b01673c0fa6a13e374b50871808eb3bf7046c4b125b216f6bf1cc604cff0dc
     # via requests

---
base-commit: 509f56ff5c24e2ad48cd2621e54c67910ea19fc1
change-id: 20251118-bump-shtab-344551bf3da9

Best regards,
--  
Tamir Duberstein <tamird@gmail.com>

