Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 460B624E81
	for <tools@linux.kernel.org>; Thu, 25 May 2023 20:11:13 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-309382efe13so1786761f8f.2
        for <tools@linux.kernel.org>; Thu, 25 May 2023 13:11:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tessares.net; s=google; t=1685045472; x=1687637472;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bCTpzvfx7kMb0Rk0cOn8T1ud6scqYziwc1+D7IhMx7M=;
        b=CascnhaMDh27fz4oROiNMwEeHIZDbgpF2Pse0gC6obZu9ew2xZl/zYItA639wQYI99
         hA6rN9fym/gJqMRnEHxNTBPOhPLpDhhV16Y2c2surXriRfcr6ZI8uX5TAjoG0s75hGt8
         rtD4+Zc/wObYCye9ZOGL5u/lgVq8u4H1OkK8wO7K1cldhkq8atJb1TwV2VO0/0vr17CP
         hWm2vSILk8MU2YCSOdGpxG8yDnM2oG11s30ce5/GR2HkUMw5eSp7t6ampHEchuqP4ya2
         sti0IEL/w23kR/J651eBaGFChv9AOulccgmINLd34BAGKPV+6KSsED2KhxCDAIRtG9J1
         dKqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685045472; x=1687637472;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bCTpzvfx7kMb0Rk0cOn8T1ud6scqYziwc1+D7IhMx7M=;
        b=cOrCKmLYjj/AblhsmLrjAkrk8zivwuHu1nIxuhigKUQpWH0h3yywj+AKzvODeKdZ63
         LfIBMRB+iqBswxEjazSb4m0GqkdJgewKhPWSnD7MqtZgrHJpXVWINykwbJlLn4wrQc/D
         MPb/EsrA2j7+x5T1cORiqvoSkKcZLlZghLaaqR1O/1t2C8HhJ6lkCNw3R89af9B1Vty6
         UqU1/RNgQ2Nb+Un2XWeS/wTrMfxsmA1P1amfHYPR+eoBAUmc8zWSDZOuF9QtwnRA+w86
         5miSX2LkEEjZJPqIyCL18+1EYE0xGylg8ZLAKdz77J3knxm1/ezQbAcEXEKftH6Ng6el
         Urng==
X-Gm-Message-State: AC+VfDyK/00MEbeTqqRlJBOcJGb9SWLpNafLJdYybT7Hi1sK/pZlBBiq
	GeSpDT3co1by/rnaggevG+wuDQ==
X-Google-Smtp-Source: ACHHUZ7HJB1r6XY65EzXNB6Jfpi8B6KkDs735yjxb5ZQ8snOW2iEQNPil05c8OBRR9NbJf5+iRH7gA==
X-Received: by 2002:adf:ec0b:0:b0:306:34e4:be40 with SMTP id x11-20020adfec0b000000b0030634e4be40mr3374965wrn.33.1685045472094;
        Thu, 25 May 2023 13:11:12 -0700 (PDT)
Received: from vdi08.nix.tessares.net (static.219.156.76.144.clients.your-server.de. [144.76.156.219])
        by smtp.gmail.com with ESMTPSA id f6-20020adff986000000b00306281cfa59sm2802772wrr.47.2023.05.25.13.11.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 May 2023 13:11:11 -0700 (PDT)
From: Matthieu Baerts <matthieu.baerts@tessares.net>
Date: Thu, 25 May 2023 22:10:37 +0200
Subject: [PATCH b4 2/2] trailers: add 'Closes' as recognized link trailer
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230525-closes-tags-v1-2-ed41b1773cb6@tessares.net>
References: <20230525-closes-tags-v1-0-ed41b1773cb6@tessares.net>
In-Reply-To: <20230525-closes-tags-v1-0-ed41b1773cb6@tessares.net>
To: "Kernel.org Tools" <tools@linux.kernel.org>
Cc: Nick Desaulniers <ndesaulniers@google.com>, 
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Matthieu Baerts <matthieu.baerts@tessares.net>, 
 Follow Upper <follow.upper@example.org>, 
 Cover Upper <cover.upper@example.org>, 
 Test Override <test-override@example.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4011;
 i=matthieu.baerts@tessares.net; h=from:subject:message-id;
 bh=A8sFO7NQ7u+LbrO5sC8hk8YXHm9J1zrfb0CF9TbQmLM=;
 b=owEBbQKS/ZANAwAIAfa3gk9CaaBzAcsmYgBkb8DdYHOAfjf0OMqrcd8gjtAkjbo1zi9mAuv0p
 2N+g/VZb7aJAjMEAAEIAB0WIQToy4X3aHcFem4n93r2t4JPQmmgcwUCZG/A3QAKCRD2t4JPQmmg
 c8poD/9YwYBtg9rFuuqu3Wp+uKDIX7xoZiQzNJFrWJefWylD/kYT6qCX39/rpStM7Mw+MpHRGiz
 BVjfRIYFXbqnl8tfTV72dHXM1ASkJI+Y7t6AtBSMx/kQVPSSM8h7BHKRLuYWlY5nBklArXTU8Tg
 G7msWUNYLbgbMd/Sdz6NfRQbHC+53P9oy8kgVUUTyOvQJ6nwX5ggQJeJswuFU80BROlqXBkHbzX
 k+yIDjAjJuXgF9g2/tAz/dSk50lLfl/2CZfosi4HPWhj63c0DJy/Rdi3f2SepFfBRnYhNFQbkHT
 beHT51mXcKBdYxBUF908VO4wDSCZFs6kQEaMBFAJYFpH6pUV2FAWhcVWHETmQzP2WO/9WUWFirM
 YXW/+lYK/lLMbGL/nnjJIuWeTkWtbnguSgc05hyVd40QboBFYvmeZTzxBwOLYI1IIlDI4cXZs9e
 2lntHW0aFnCGeCZSVh59/y0Y31uhyb1uLbl/5KA5rXTVSCx8zvYrk1cqjT/emYKppG0UHHVX+8S
 vxL2/t8/Zs21ZCsOoOYYn/cyoBpCvxHnoZ5Ofoxq+lA5APTlTl3JsCYdxpXNUKhNtwDiukaUqj3
 72fpdpH4iJrui95RQcM4jaIZaEZk2LVBeZ4+OO4bkFGXpGs6VixJGX42RW0G8eklJ6LfyUjFKF+
 3xJCy2XKML5FEkQ==
X-Developer-Key: i=matthieu.baerts@tessares.net; a=openpgp;
 fpr=E8CB85F76877057A6E27F77AF6B7824F4269A073

The Closes tag has been used for quite a long time in the Linux kernel,
mainly by DRM and MPTCP subsystems. It is used by some bug trackers like
GitHub, GitLab and bugzilla.kernel.org to automate the closure of issues
when a patch is accepted.

In Linux 6.3, checkpatch started to complain about this tag because it
has never been described in the documentation. The situation has changed
in Linux 6.4 [1]: I initially just wanted to allow the Closes tag but
some reviewers pointed out that bots reading mailing lists like RegzBot
would be interested to have it instead of the Link tag when any kind of
bug is being closed. So now after a Reported-by, checkpatch.pl now
suggests to add a Closes with a link.

In other words, it is now more common to see this Closes tag in the
Linux kernel. It is certainly used in many other projects than the Linux
kernel.

This Closes tag is treated as a Link tag.

Note that existing test files have been modified. You will probably need
to run "pytest --cache-clear" to avoid using the previous version.

Link: https://lore.kernel.org/all/20230314-doc-checkpatch-closes-tag-v4-0-d26d1fa66f9f@tessares.net/ [1]
Reported-by: Nick Desaulniers <ndesaulniers@google.com>
Closes: https://lore.kernel.org/all/CAKwvOdm=Zk8YhrPptN3k7UQo+1n7Ws=Qox=BwTR9bbjPJJYz8A@mail.gmail.com/
Signed-off-by: Matthieu Baerts <matthieu.baerts@tessares.net>
---
 b4/__init__.py                                           | 4 ++--
 tests/samples/trailers-thread-with-cover-followup.mbox   | 1 +
 tests/samples/trailers-thread-with-cover-followup.verify | 1 +
 3 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/b4/__init__.py b/b4/__init__.py
index e9e7b64..44deacd 100644
--- a/b4/__init__.py
+++ b/b4/__init__.py
@@ -885,7 +885,7 @@ class LoreTrailer:
     addr: Optional[Tuple[str, str]] = None
     lmsg = None
     # Small list of recognized utility trailers
-    _utility: Set[str] = {'fixes', 'link', 'buglink', 'obsoleted-by', 'message-id', 'change-id', 'base-commit'}
+    _utility: Set[str] = {'fixes', 'link', 'buglink', 'closes', 'obsoleted-by', 'message-id', 'change-id', 'base-commit'}
 
     def __init__(self, name: Optional[str] = None, value: Optional[str] = None, extinfo: Optional[str] = None,
                  msg: Optional[email.message.Message] = None):
@@ -1656,7 +1656,7 @@ class LoreMessage:
     def find_trailers(body: str, followup: bool = False) -> Tuple[List[LoreTrailer], List[str]]:
         ignores = {'phone', 'email'}
         headers = {'subject', 'date', 'from'}
-        links = {'link', 'buglink'}
+        links = {'link', 'buglink', 'closes'}
         nonperson = links | {'fixes', 'subject', 'date', 'obsoleted-by', 'change-id', 'base-commit'}
         # Ignore everything below standard email signature marker
         body = body.split('\n-- \n', 1)[0].strip() + '\n'
diff --git a/tests/samples/trailers-thread-with-cover-followup.mbox b/tests/samples/trailers-thread-with-cover-followup.mbox
index bbdeeeb..5c4e64e 100644
--- a/tests/samples/trailers-thread-with-cover-followup.mbox
+++ b/tests/samples/trailers-thread-with-cover-followup.mbox
@@ -226,6 +226,7 @@ To: list@example.org
 
 Tested-by: Follow Upper <follow.upper@example.org>
 Link: https://example.org
+Closes: https://example.org/bug/1234
 
 -- 
 Follow Upper
diff --git a/tests/samples/trailers-thread-with-cover-followup.verify b/tests/samples/trailers-thread-with-cover-followup.verify
index b42e1ed..acd6278 100644
--- a/tests/samples/trailers-thread-with-cover-followup.verify
+++ b/tests/samples/trailers-thread-with-cover-followup.verify
@@ -5,6 +5,7 @@ Life imitatus artem.
 Signed-off-by: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
 Tested-by: Follow Upper <follow.upper@example.org>
 Link: https://example.org
+Closes: https://example.org/bug/1234
 Reviewed-by: Cover Upper <cover.upper@example.org>
 Signed-off-by: Test Override <test-override@example.com>
 ---

-- 
2.39.2

