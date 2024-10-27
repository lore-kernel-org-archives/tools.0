Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B14E517C61
	for <tools@linux.kernel.org>; Sun, 27 Oct 2024 22:35:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730068502; cv=none; b=ts9o9hrHSqFqr5D4ouogE8boEIHP9hUchGAx8C6bLu7rqtB3t1JJrpLVxzRG+ZUsmL4wMNT34543eHLugmyl3QH6WRaE1M4vAgb9gNZPji0tYVGoV9xMYuSjMFjwml3SGMnxXWB4Yx6ik6GTtwfXlqV702GX7EWLnWutVBrMLDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730068502; c=relaxed/simple;
	bh=s0GkUkyI+xw4qoZyT7emCLlXC/bH1dUlbaE2XltqqKI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EaGnFnw0K/s8s5/FIi1KDduxbtQZ5aTgG0/qgn/enWsr48heAdqFyvtzaAGhcSR3dnpCttCxgmThUGJLk+f5B5k5aOuu3JkClUxQUShnI9jYdDxC2JwKx//rwF+mgBTBsshfQSWCsYVsJpx+nOODHG2D41AC1TdDpXaUZjcDNk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FAYPvAIf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FAYPvAIf"
Received: by smtp.kernel.org (Postfix)
	id 9993BC4CEE5; Sun, 27 Oct 2024 22:35:02 +0000 (UTC)
Received: from mail-il1-f181.google.com (mail-il1-f181.google.com [209.85.166.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id AC95AC4CEC3
	for <tools@kernel.org>; Sun, 27 Oct 2024 22:35:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org AC95AC4CEC3
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f181.google.com with SMTP id e9e14a558f8ab-3a4e48b61fcso9280885ab.2
        for <tools@kernel.org>; Sun, 27 Oct 2024 15:35:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730068501; x=1730673301; darn=kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zTARtdoY1LxckmFLu4z4WfI+G6/jlXJBnTBQVa55xSo=;
        b=FAYPvAIf1BSx2iORvSxr96QEuVKCgxY2W2fPI5i7lge4SiZMdAQIYKm6RMFsseDlAB
         83FwZOFxHhW81uE6fzFVr+kfnPNuabP0bY2JtG66gD+GPz+BKfPwZ4okHdRVGXQ/QG6X
         Dom9sFy4g/oMVZWvesdnCoF6SpIG5N70gVfAhH+9NZNW+4o2PFtQykyRyhlQn9LsTiHF
         rmnPd12GN4wVUnxbZZw9MOB3bpd+kFOLBR7QyVfZw82HAWg7WVaoVSD79I574EAOxnXf
         oNUVUbLuXzC4/r7fO5hjCiBTR5si6JsHiT0o0AvSh3/qF7wL9/fsXI9OmSLmn2OnJgYG
         zg9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730068501; x=1730673301;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zTARtdoY1LxckmFLu4z4WfI+G6/jlXJBnTBQVa55xSo=;
        b=TkrMQruhmyYmuRowDsgFdMJiHJXPTW8ccC0UhREkzGA8ghjvV55LsxodD1h6slwyfK
         wIlXs+VZXzBe2acCY3tp00iwWMxBc4zPF5U1kY/IZgYm79Fwo69+2LAUgUU2rApNdraP
         Yy16/zzjyC4PrWp+CVTfayapZwGW2+ftigJe653Fxk2qlr0qq+GHnx9+A6aJVjaUWoxx
         xT+Sb+ftmvLsHICGWxVx2I/mkfjl4AeIiQKOYRUolOVqgQ6iRM/+RjU5A28AzFqhWv1f
         p1UQJ7aE8eJbHwbdeKFzzsv64a5j0VOoZcTUkcUS40HZB2TBVK1iaQ2gILMj9GDuKxaH
         lYmw==
X-Gm-Message-State: AOJu0Yz6HYgchfWFQtctV4ax9ORVqtaKiSapxnvpgLQxc5tG+VDW5s2J
	kHQfMB7oqZTx36J9Y9OkwAJ/8dcZvsHtrGvRGG12BLKI+iXergtqIWgL8oNE
X-Google-Smtp-Source: AGHT+IHf5HrCdtG5ULjfrPHmhZ1+xbPIUh0mGM88bUxLGZG/n6nFgfi2KGmXa/oujOZqAo03q50LBg==
X-Received: by 2002:a05:6e02:198f:b0:3a0:90d6:1f39 with SMTP id e9e14a558f8ab-3a4ed27a632mr52115805ab.2.1730068500669;
        Sun, 27 Oct 2024 15:35:00 -0700 (PDT)
Received: from localhost (207-191-210-45.dhcp.imoncommunications.net. [207.191.210.45])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3a4e6e022e2sm13464625ab.51.2024.10.27.15.34.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Oct 2024 15:35:00 -0700 (PDT)
From: Brandon Maier <brandon.maier@gmail.com>
Date: Sun, 27 Oct 2024 17:34:54 -0500
Subject: [PATCH b4 v2 1/6] src/tests: check trailer extinfo
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241027-trailer-special-chars-v2-1-e963f78b3ef8@gmail.com>
References: <20241027-trailer-special-chars-v2-0-e963f78b3ef8@gmail.com>
In-Reply-To: <20241027-trailer-special-chars-v2-0-e963f78b3ef8@gmail.com>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Brandon Maier <brandon.maier@gmail.com>, 
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>
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

