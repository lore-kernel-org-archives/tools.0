Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A342717C61
	for <tools@linux.kernel.org>; Sun, 27 Oct 2024 22:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730068505; cv=none; b=n0zJJ5A96QJv7GDeoVdEYdW3YT31r4M0QJHQ+nqRmGnkIzCgBIhLb6mIwe+Mm8XEJ8zFlbLP7JOrMmCLZH4XG2Iy6E7A/AmFpYbGeN6VsVGRWDXyhjoqxu1V+eZZfs2FmLCbUANV+XC3SLrIOCYkN9HwYAIKt1r8wNGqhz8pA6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730068505; c=relaxed/simple;
	bh=FoJJ2h90LlibaI4SbrmizAGIBwMOx15jNQuyL67WDHw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VJtpcP6N2M3l70XmR7SgSd/mPSmOpO/Hn3teF9b2Gr7fWGHsjrCdEcGc52OP+BQ/9BAG7ZHQmzl4oTxhQWNNz0WAdKREBW5yM6PKc9iQsyW+Y1MwkAa4gE6ZvX5mXU+VR555oUE1TQB6v4FtBiPjjnHlOXabysFIwh8eJjHpID8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QfjmIQ+u; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QfjmIQ+u"
Received: by smtp.kernel.org (Postfix)
	id 5AAA4C4CEE9; Sun, 27 Oct 2024 22:35:05 +0000 (UTC)
Received: from mail-io1-f46.google.com (mail-io1-f46.google.com [209.85.166.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7D3DBC4CEE5
	for <tools@kernel.org>; Sun, 27 Oct 2024 22:35:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 7D3DBC4CEE5
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-io1-f46.google.com with SMTP id ca18e2360f4ac-83aae6aba1aso125234839f.2
        for <tools@kernel.org>; Sun, 27 Oct 2024 15:35:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730068503; x=1730673303; darn=kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bTKpU7tb6k7g67R2E6TGtP/hOf6u3m1LQ07VQt+VPxQ=;
        b=QfjmIQ+uqRS0Cv8UadOLdt5KEfRQLQ99dceFx62W2ffAxzy0lHmKEYNEy9DncVifKo
         A96h7jQTHTP6UMCwLwToyGDH6a4+CrADPQB+zxs5oWQWf7nCVI0S3vQnlsgIAEq4w0aR
         YAKLU1UbAXySQO/3ZZ/PAKHLmfYi6PUwKrR41of4BdHdjqmsO9EfD4xUJV8NtQsaGo8I
         M9QVMa5eueIXgmkaL/IES+lJaMKb4iDusJ4yO/ZltqAzOFuo/1kEnHxYaEuZtfZa5MmL
         AQfTVdHcGp4BT8nDiuELJh7biowiyflH5FTwCLAPNx5dCyr9agicwIDS6zfiFmOn9H+w
         twgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730068503; x=1730673303;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bTKpU7tb6k7g67R2E6TGtP/hOf6u3m1LQ07VQt+VPxQ=;
        b=UpEeEOLXMwxgP5fp2QRxFX73yhHHMgHqGfmlNVCwJmc4XLqY35uVq6Yyswjn6KDNDK
         hnvM9yAaa6bBU8hfcsiEp/5iNo/WQ4z74DXv8rTMrr9Q2VjczFRxmQiIXs+qQ3pBtaZS
         W6NEjdbWnwXQi/02s69NZ9NoV0E9u5tGWkxSW4bp2idJyO7vcFJFFRzvANX36drXIyRz
         7OvdhjUgsQ4DHS1vC8GyEH/uyorNjG95Lf14tuELCbpAad3m3A5+3VbDd5cRj67fOJh0
         D1FcFho9DSqmId1PeHcIaITJZ/sRzN9LHz1f5wCvVnVmN0qapyGM9CxDaQTwoQBgWci3
         v7oQ==
X-Gm-Message-State: AOJu0YzHEAmZ8rxn67T0vgdIgqZc0lRjSpdpTrQSQzhMeSXQtn5rjlE6
	6+yiWUSbjLw0NesEpePIQiNs3DUCH8eComg4c2LeZ2VVc6EaG8ZMbo9AhvXE
X-Google-Smtp-Source: AGHT+IH7lH8spDqU5JECRb6mvViLKmtroTGCBlGvLNNHQ9BdBZZdMQmgz2hKLirjhYw/1ccZjRmK4w==
X-Received: by 2002:a05:6602:2cc4:b0:835:4931:b110 with SMTP id ca18e2360f4ac-83b1c488fa5mr591698639f.5.1730068503279;
        Sun, 27 Oct 2024 15:35:03 -0700 (PDT)
Received: from localhost (207-191-210-45.dhcp.imoncommunications.net. [207.191.210.45])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-83b1384e826sm120378339f.42.2024.10.27.15.35.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Oct 2024 15:35:02 -0700 (PDT)
From: Brandon Maier <brandon.maier@gmail.com>
Date: Sun, 27 Oct 2024 17:34:56 -0500
Subject: [PATCH b4 v2 3/6] b4: handle trailers with improper formatting
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241027-trailer-special-chars-v2-3-e963f78b3ef8@gmail.com>
References: <20241027-trailer-special-chars-v2-0-e963f78b3ef8@gmail.com>
In-Reply-To: <20241027-trailer-special-chars-v2-0-e963f78b3ef8@gmail.com>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Brandon Maier <brandon.maier@gmail.com>, 
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>
X-Mailer: b4 0.15-dev

A patch trailer with an improperly formatted email parses to an empty
string. For example see the linked github issue, where a trailer's
display name contains an unquoted comma.

As patch trailers are often hand written this can happen frequently. Try
to gracefully handle this case by checking if an email parses correctly,
and if it doesn't fallback to displaying it verbatim.

Fixes: https://github.com/mricon/b4/issues/50
Signed-off-by: Brandon Maier <brandon.maier@gmail.com>
---
 src/b4/__init__.py | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/src/b4/__init__.py b/src/b4/__init__.py
index 5115a9cd9b8746f84eb104a2be69fe121724167e..cf112e3bce2911c78cff18aac267608f796957ab 100644
--- a/src/b4/__init__.py
+++ b/src/b4/__init__.py
@@ -1063,8 +1063,10 @@ def __init__(self, name: Optional[str] = None, value: Optional[str] = None, exti
                 # Normalize the value with parsed data
                 if self.addr[0]:
                     self.value = f'{self.addr[0]} <{self.addr[1]}>'
-                else:
+                elif self.addr[1]:
                     self.value = self.addr[1]
+                else:
+                    self.type = 'unknown'
             else:
                 self.type = 'unknown'
         self.lname = self.name.lower()

-- 
2.47.0

