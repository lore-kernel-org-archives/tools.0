Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01B711E50B
	for <tools@linux.kernel.org>; Sun, 27 Oct 2024 15:34:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730043246; cv=none; b=Wr/ukFKr5bjMLm6GQ7BgoThCSNUP8lKHrjQeDpRFtGkb14Dcf6QpdZCkbr8roJOSaFJpZT+yuOhYEurDepTNHygIeKyuCjZhxCtzzVvNA3Tht5pUW9dIADOTkG0xEeRErGMx8hQXf0z1Nnjx4qEOEME/UkZ71aQXbR5nz7ZODVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730043246; c=relaxed/simple;
	bh=GGJwFy34mHw7bB1vesQgsnGBfdaLZaHavNzZFf/l4h0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FG9gpyYbVBB3CJsViUexJdrx75JzNLYHmQEZ2BN1EF6rLfdnj4v/POkCh+9/ijMjd8XBYyOFN90cTTvrfi03BXTHTzT9J2u9wfEvpOSv8Qe/SI6zlldrv8eKi3mdu1ZzQLdQQl9dVroX1I/vBEQDR/hqwSY8M1KaeaULvhhggrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WlwSiUwo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WlwSiUwo"
Received: by smtp.kernel.org (Postfix)
	id 99D40C4CEC3; Sun, 27 Oct 2024 15:34:05 +0000 (UTC)
Received: from mail-io1-f41.google.com (mail-io1-f41.google.com [209.85.166.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B2DCEC4CEE6
	for <tools@kernel.org>; Sun, 27 Oct 2024 15:34:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org B2DCEC4CEE6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-io1-f41.google.com with SMTP id ca18e2360f4ac-8323b555a6aso192700839f.3
        for <tools@kernel.org>; Sun, 27 Oct 2024 08:34:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730043244; x=1730648044; darn=kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nzybut7DKwbDAB6NU+v5yQnUqno+TdOhgfDSeNExLDA=;
        b=WlwSiUwoZY9SjdLh27HzTWT+vRb/eRTxSIpn2zOj4QOg3R1wFlecpy+uQpDh12F/+C
         js4k9wIp+5tyoAiQOCvvni827fMhVU+jY45Rr7ToYt6qkUvXwkvfJ6yjL0tM47Rz2fLz
         oUm0D3Zxc+zZF0VKq2y4R8YFWN3I/edqWHvfVP5/1AKoKcHRlEx4vMk6miZ/1xFl2Ei7
         O4tcu8IV+RmJsh4AE4zObYdAwjUOdKAhxFqy0o9xGE2BsGSb0c9orzHF1RE7AliiZVDR
         GR4dzAor1sDTGEP1W584fOgoBYn8jvfK2dRMCVI6BSEgmvC0DkyOPTPntwNGs51XDzxv
         gt6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730043244; x=1730648044;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nzybut7DKwbDAB6NU+v5yQnUqno+TdOhgfDSeNExLDA=;
        b=aCvtFK2pa5XDIpwC1tja4eW23FjsE+7YIfQTg2crT+aV1EGFZO8weVSsTvjxZqaejw
         qwW48TfeX63akeQT6atMlQF/wUZqrW/lQq5GHwOBLL+6EQs6mvbEYBKM9pZPbpCTKBm4
         j18+EbpGEKIFXvQGy2ywlPGjK0F2NcsNyN5UEAFj1gkuDZz6bjgNf/5Xih/W441dnp8W
         X/UaTEY/FStg3SaxI1cvtMchH1rnvH628Z5Y9T+8iQFeWW+kAYhGCHpF88ltGsC6UOmR
         0PZIEvgbT8KdjYrEt1taRNnwVfqQLWj+1nQMsYAFPpj0ClPCviDODDVdi/Rx8eIFkDom
         e0CQ==
X-Gm-Message-State: AOJu0YwCTni67qQieNlv15OdZ4IQ8sudYmRlBFQpnIOnX22uhy8dnmgZ
	XzTaJJe3Kkrgl/taIuGqDfUJ/XxNSqGYLyf3L3NQmhMNuFs83Ra0GhQfkR3A
X-Google-Smtp-Source: AGHT+IFxi8u/ODY1vU9/eIoo8Ps64gXGl5un2w4Md+W93cmIcGk1izaSwh1hF7KGfJTs29eQgq0Dfw==
X-Received: by 2002:a05:6e02:180a:b0:3a2:f7b1:2f89 with SMTP id e9e14a558f8ab-3a4ed2e91c6mr41973775ab.18.1730043243831;
        Sun, 27 Oct 2024 08:34:03 -0700 (PDT)
Received: from localhost (207-191-210-45.dhcp.imoncommunications.net. [207.191.210.45])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3a4e6e56f24sm12260425ab.58.2024.10.27.08.34.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Oct 2024 08:34:03 -0700 (PDT)
From: Brandon Maier <brandon.maier@gmail.com>
Date: Sun, 27 Oct 2024 10:33:57 -0500
Subject: [PATCH b4 5/6] b4: handle trailers with special characters
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241027-trailer-special-chars-v1-5-1bd180dba425@gmail.com>
References: <20241027-trailer-special-chars-v1-0-1bd180dba425@gmail.com>
In-Reply-To: <20241027-trailer-special-chars-v1-0-1bd180dba425@gmail.com>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Brandon Maier <brandon.maier@gmail.com>
X-Mailer: b4 0.15-dev

Parsing an email trailer with special characters breaks the formatting.
For example this trailer.

> Reviewed-by: "Doe, Jane" <jane@example.com>

Will get parsed into this.

> Reviewed-by: Doe, Jane <jane@example.com>

This is because b4.LoreTrailer attempts to reformat the trailer using a
naive string format. Instead use the Python standard library formataddr
function which correctly handles special characters.

Signed-off-by: Brandon Maier <brandon.maier@gmail.com>
---
 src/b4/__init__.py | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/src/b4/__init__.py b/src/b4/__init__.py
index cf112e3bce2911c78cff18aac267608f796957ab..0785be8ffcef08fb5cd4c484a40e6fe856446cfe 100644
--- a/src/b4/__init__.py
+++ b/src/b4/__init__.py
@@ -1061,10 +1061,8 @@ def __init__(self, name: Optional[str] = None, value: Optional[str] = None, exti
                 self.type = 'person'
                 self.addr = email.utils.parseaddr(value)
                 # Normalize the value with parsed data
-                if self.addr[0]:
-                    self.value = f'{self.addr[0]} <{self.addr[1]}>'
-                elif self.addr[1]:
-                    self.value = self.addr[1]
+                if self.addr[0] or self.addr[1]:
+                    self.value = email.utils.formataddr(self.addr)
                 else:
                     self.type = 'unknown'
             else:

-- 
2.47.0

