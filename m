Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41BAF1E50B
	for <tools@linux.kernel.org>; Sun, 27 Oct 2024 15:34:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730043240; cv=none; b=dXCKMBSf7L54Y4uzytbjoV/BrL0x9orxulM6tdzZJjPYzxvBW5h6t+DyGlsU9WWl11KbyC/X4LyNnsGEjJfzQ9lmMuvuQOT2dvVM/DtyYm8gXWe8XyjGZcN2fiujoEOWp4imd1ygt55FQBlFHvb5beMiM2MBkZ/uy0hTo3K2Vb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730043240; c=relaxed/simple;
	bh=s0GkUkyI+xw4qoZyT7emCLlXC/bH1dUlbaE2XltqqKI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=m3BXrzgldkYY2QfHTildqsNZO8v8AUrwDi2zSs9VfoXgU7WlPzda8lEtfYCpdoUpa/e0xKZlTuQ9v7fiDp+sA1Zi17umQNg92QgCjtBICMZG8lbNACQ1BMyCv5gm2I/gdYrAnesP6cZ+JDWINlsty9+pWmfWsFP1DvZdaHb2+LU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EbE/ZiZM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EbE/ZiZM"
Received: by smtp.kernel.org (Postfix)
	id 2B931C4CEC7; Sun, 27 Oct 2024 15:34:00 +0000 (UTC)
Received: from mail-il1-f176.google.com (mail-il1-f176.google.com [209.85.166.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 484D6C4CEC3
	for <tools@kernel.org>; Sun, 27 Oct 2024 15:33:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 484D6C4CEC3
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f176.google.com with SMTP id e9e14a558f8ab-3a4e30bffe3so9138535ab.3
        for <tools@kernel.org>; Sun, 27 Oct 2024 08:33:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730043238; x=1730648038; darn=kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zTARtdoY1LxckmFLu4z4WfI+G6/jlXJBnTBQVa55xSo=;
        b=EbE/ZiZMPbCAZ8oJRZr9Ga1uRb9ylNbcFf1VWKfaKCcgAmbWuFInql39gPqN7zePHz
         VNLH4CRdRZu5nTnpty0Y/GJxhKR2teaNrxgaOCi5MnJqVqYY+HVBan0iu9cbulCpZNSa
         mjfYD9ulBdPTulqsMth66idYvzdYgVPqTDE+yq2o+DdZ5y6lKBCdQPP50Cz0GXjLzy8g
         6vWSsFDFYaBtSh/Plydf7degw86kt2iiOLsoYONWawVzYjQ6bITwezNf8WH/y2qvLPtI
         OWLGA47tEUD7WyvVi9WCJEUI0CEpZgHFT+2UerOlPoysTKemPzeQdnIBFaLm4dgjBYUS
         lYRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730043238; x=1730648038;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zTARtdoY1LxckmFLu4z4WfI+G6/jlXJBnTBQVa55xSo=;
        b=hRqc2d1X8RE5VTkNl1I/GSVBrwEQK23psIW1hZq8tg0r2uumKb54/KjTd+pi7FoiNJ
         QEZ0VVPDwAc5hN2oKygnuRKu1MgtzLBG4YqD3qOx/g5m+c+1xLqPGlXDZ+KL3CQsHV67
         w9vRCiSjrkheeyKenC+v8Q1YW85Zy2rI0EotbYoFrjyDRLHVi+BnsHTrO5Npul6DrSda
         oUSakmMJUmnH9+jVvMfcB/BGT0dyLKW0568zPtiXCMnv4OUVtB085LJs6zgqvTihe9d/
         GP9ei3F3+K/Yi71zQk23T0bDo9B/QGq+uEzkB2fc1id98aaOvnezPAGhSoHVC0Rr3YNp
         KY9A==
X-Gm-Message-State: AOJu0YyhsbzFZFu/DCrIJWvaa2PrVPF/Ev5nIgXj0hWW8RkUrj+nHk/F
	NxQEuTx5mL9iNL82QWsXmbpa3t9CmdM1pXwQLhGwyxjbjCyanB5ETOnXiSsl
X-Google-Smtp-Source: AGHT+IEJAVDxZ2QBdGtOYi+HJIfBVleBC/HBEq3zZPRGM3QaAtQuBjJjDb0IT2naFSx6Yvz0EEF+Qg==
X-Received: by 2002:a05:6e02:1a44:b0:3a4:ec57:d7b3 with SMTP id e9e14a558f8ab-3a4ed294445mr45091405ab.12.1730043238217;
        Sun, 27 Oct 2024 08:33:58 -0700 (PDT)
Received: from localhost (207-191-210-45.dhcp.imoncommunications.net. [207.191.210.45])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4dc72617208sm1219716173.63.2024.10.27.08.33.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Oct 2024 08:33:57 -0700 (PDT)
From: Brandon Maier <brandon.maier@gmail.com>
Date: Sun, 27 Oct 2024 10:33:53 -0500
Subject: [PATCH b4 1/6] src/tests: check trailer extinfo
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241027-trailer-special-chars-v1-1-1bd180dba425@gmail.com>
References: <20241027-trailer-special-chars-v1-0-1bd180dba425@gmail.com>
In-Reply-To: <20241027-trailer-special-chars-v1-0-1bd180dba425@gmail.com>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Brandon Maier <brandon.maier@gmail.com>
X-Mailer: b4 0.15-dev

The b4.LoreTrailer.__eq__ ignores the 'extinfo' of a trailer. So the
trailer test is not checking that extinfo is parsed correctly.

Signed-off-by: Brandon Maier <brandon.maier@gmail.com>
---
 src/tests/test___init__.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/src/tests/test___init__.py b/src/tests/test___init__.py
index 297e5120a8c8adf241660f06e9a83c1ff4a0fd3a..dbc92c7e8352728c2f2a951f7b9b1496ccbaf2c5 100644
--- a/src/tests/test___init__.py
+++ b/src/tests/test___init__.py
@@ -79,6 +79,7 @@ def test_parse_trailers(sampledir, source, expected):
             mytype, myname, myvalue, myextinfo = expected.pop(0)
             mytr = b4.LoreTrailer(name=myname, value=myvalue, extinfo=myextinfo)
             assert tr == mytr
+            assert tr.extinfo == mytr.extinfo
             assert tr.type == mytype
 
 

-- 
2.47.0

