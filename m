Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99C2717C61
	for <tools@linux.kernel.org>; Sun, 27 Oct 2024 22:35:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730068504; cv=none; b=fRV4nLZaObfzondc1MZoIz5JHYukZb/M9Q5hdmgCPy1TLCN6tfZMfvQQX8ljSH3uFcOsi18ilyHOAO9imDcM7Q3DKmyXmHGjVi5nCH0G4Z4ymYzV4LapQ9UOzff/KAQex828p8zm9vlXOt9+jf53HLUqE6WfXOESp0t9aYsK7UQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730068504; c=relaxed/simple;
	bh=bl0MQPpbsfgbfqmd1BPBHQsu6XfUgO+CUPuk0F2si2k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Dnt4o6aLawVSg0oI9k0feEJIcPtpsr39dnXkIv0Xieu8+dcV1yUQKhAppPvOwl8oUA2a8/wxYc7VDF7DGaTjsO4gy9MwLjlcqK/7CGu3kNNmBxqRBAf5RJFp4tSOhrRWuwCuwP6CUNzJxxv25ogjPhzNAOJSM6n4hrJs/7I0plU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V/mucvjR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V/mucvjR"
Received: by smtp.kernel.org (Postfix)
	id 40963C4CEE4; Sun, 27 Oct 2024 22:35:04 +0000 (UTC)
Received: from mail-io1-f50.google.com (mail-io1-f50.google.com [209.85.166.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id DCD3AC4CEC3
	for <tools@kernel.org>; Sun, 27 Oct 2024 22:35:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org DCD3AC4CEC3
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-io1-f50.google.com with SMTP id ca18e2360f4ac-83abcfb9f37so144513839f.1
        for <tools@kernel.org>; Sun, 27 Oct 2024 15:35:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730068502; x=1730673302; darn=kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=feNtiNDrvPASm9AMoQZM6ZYoF2Qw3Q8IJGxUNfSfC08=;
        b=V/mucvjR/aFh1PM1DiPc6RlKzTOv8oXgw7Y3OyjSnrMPCryVS4NBztx18ZiSrftJom
         S0Y0l3p1GwxlR2+Fh/8BZKbX6a92uerrp4XcJVl3rugJejc9jk/JafI9Mre30Mb/2aWs
         XAWhRU9VamHDqatix+UL5YQksuNcZgrCyP+5wqkj6H6ecAariAr+TxuJtMyawPa5U9kh
         OWmdaFxLxRVYyLYmmwetTrpPnofCUk9oMuDsM1ToBcDLPYHH4l9pWq9UufbSIg1lkdpO
         ggVEuciPOB4jyozB/vyUFAyXUW62VWKmJhMTrlu9Aq52uO+J5sY2mHkN+SUJztvPG+uF
         WeZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730068502; x=1730673302;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=feNtiNDrvPASm9AMoQZM6ZYoF2Qw3Q8IJGxUNfSfC08=;
        b=DK14OTMTkbfIkUn8DZLV9Xaf3b0YgEaKCH9fTdKBK+Evk7pDkOtpnrklMhuyx5ayG5
         kMFnq2i6Y20qu/6WgdE/wyAE8A57AUExnQD8TOEZenXHj42fKwc0lFRA4qJgVrNUalho
         r+ytE2PcmwK+YRo5FQe2L7Wu/o4NwSf+aktorDcqhEOQDGrHUfeOhX9g0wNfdCpUN1HF
         +fqoEL2YbXDzVbts3/PB4pRZdi3BLj+/xYEd5d7wJsm+Q+Z0FpJM8Hx8qMCSUgUd4veH
         trWUxk2bYMuYHTk/zNklsbhoSAj9AF5Pu2eyhOCHwRsAnCyxU/L/BCZfNhT7TEfDJrAA
         eG4Q==
X-Gm-Message-State: AOJu0Yz7IFbxLlwkABse4TmjgT3JrWZMl5PfRdsRYj7wrNlSw2vcyZEd
	31t42iIGWl41qv8kmUyCHPZpzzIdDYXshwFrKtI66KT6n5wBiabDyLpBrEna
X-Google-Smtp-Source: AGHT+IHRtr9oP6IF5Qk82pkmSOZBIN9MTA5nnCssPzEvpjMjWQysUzL2pl4i9uqGm32NaU4WtpnYfA==
X-Received: by 2002:a05:6e02:16cf:b0:3a3:da4f:79ec with SMTP id e9e14a558f8ab-3a4ed295ba9mr50288275ab.7.1730068501802;
        Sun, 27 Oct 2024 15:35:01 -0700 (PDT)
Received: from localhost (207-191-210-45.dhcp.imoncommunications.net. [207.191.210.45])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4dc72784db5sm1358647173.148.2024.10.27.15.35.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Oct 2024 15:35:01 -0700 (PDT)
From: Brandon Maier <brandon.maier@gmail.com>
Date: Sun, 27 Oct 2024 17:34:55 -0500
Subject: [PATCH b4 v2 2/6] src/tests: fix trailer test hiding parser errors
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241027-trailer-special-chars-v2-2-e963f78b3ef8@gmail.com>
References: <20241027-trailer-special-chars-v2-0-e963f78b3ef8@gmail.com>
In-Reply-To: <20241027-trailer-special-chars-v2-0-e963f78b3ef8@gmail.com>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Brandon Maier <brandon.maier@gmail.com>, 
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>
X-Mailer: b4 0.15-dev

The trailer parsing test compares the values of the b4.LoreTrailer
object created from the test input against a b4.LoreTrailer object
created from our expected test input.

This means if there is an error in how b4.LoreTrailer parses input, it
won't be detected. This was discovered from a reported bug with parsing
email trailers with embedded ','.

Bug: https://github.com/mricon/b4/issues/50
---
 src/tests/test___init__.py | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/src/tests/test___init__.py b/src/tests/test___init__.py
index dbc92c7e8352728c2f2a951f7b9b1496ccbaf2c5..7fe43b0158460f06d0a2b52d2689d26e7ef7f840 100644
--- a/src/tests/test___init__.py
+++ b/src/tests/test___init__.py
@@ -57,7 +57,7 @@ def test_save_git_am_mbox(sampledir, tmp_path, source, regex, flags, ismbox):
 
 @pytest.mark.parametrize('source,expected', [
     ('trailers-test-simple',
-     [('person', 'Reviewed-By', 'Bogus Bupkes <bogus@example.com>', None),
+     [('person', 'Reviewed-by', 'Bogus Bupkes <bogus@example.com>', None),
       ('utility', 'Fixes', 'abcdef01234567890', None),
       ('utility', 'Link', 'https://msgid.link/some@msgid.here', None),
       ]),
@@ -77,10 +77,14 @@ def test_parse_trailers(sampledir, source, expected):
         assert len(expected) == len(trs)
         for tr in trs:
             mytype, myname, myvalue, myextinfo = expected.pop(0)
+            assert tr.name == myname
+            assert tr.value == myvalue
+            assert tr.extinfo == myextinfo
+            assert tr.type == mytype
+
             mytr = b4.LoreTrailer(name=myname, value=myvalue, extinfo=myextinfo)
             assert tr == mytr
             assert tr.extinfo == mytr.extinfo
-            assert tr.type == mytype
 
 
 @pytest.mark.parametrize('source,serargs,amargs,reference,b4cfg', [

-- 
2.47.0

