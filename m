Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9C631363
	for <tools@linux.kernel.org>; Wed, 22 Feb 2023 01:29:46 +0000 (UTC)
Received: by mail-qv1-f46.google.com with SMTP id f1so7735426qvx.13
        for <tools@linux.kernel.org>; Tue, 21 Feb 2023 17:29:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yWaxWAlMcLUKLLQLKu+zg3Fg4k8x853cqwk1ZQF/8JI=;
        b=Zm20qWXP6QHQyTVqL0o7J4nykdr6c1hihOElcBrQdPkaViopzHCR/fpDBhnVUQ+DoX
         qxgDk7al+/2nSOPRzgAtBbLp2IdEbjMc2EQIon0TVkQPMA2yXBEySQRZ5ukWNQoHqPcz
         cmGQvt4A6Nj9qVTYIhBdi+tGzrDpLoK3Psoe6VQjPNAQAE9FpeS/gKPT052jsKD/hhHc
         Ngyl6gbzh6fVsQhZhrKdjAR9ASgVbzm4NQbY9NQw6YP0Jiy/zaAWzJrTNVvKA8LioF01
         SXThmBcchZKgH5uvj7HdGnCjKBCJ/4PqhnnWgGLubnSD/lNK3kx+mv5CzE8UAKjvzH0w
         XVcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yWaxWAlMcLUKLLQLKu+zg3Fg4k8x853cqwk1ZQF/8JI=;
        b=lXI38pNrBP/BYfjpVKGK3iyU/4hx2hesvMjThzzy3QoxHJlkPmdfXaVkroxp2wnqD3
         9ffNzk7NHEBkRhamMw/kH9CgNPA61Zzq4W3Lzti/WnZwf3L22Zu53yUuSy59liAvSDFi
         9ey+TP9fU2Hs9UWR3m+kgzf1vnoqg7N6/fsBMLK6d1cdYz0wKkZCZu14iWlcSB/W23iA
         eYTb/11bw4l9fjcHBbeF9joz01SdgzF0/lRR62pSNSBmc8ZezQntonjMat6DYpu0s5PZ
         fvW8Fm1iEPT34szJzriKAwH1v0pzWAW4YlMYzXpmeQnQqK3DGKYysl0VIq8kIEXmbsGW
         UIaQ==
X-Gm-Message-State: AO0yUKWQDeKoZ0AN66h0e1wDd4o6qqJXs/d98w6NqpM32kV3qtVKLsyr
	vjkmgAvsfVMHF6ZyCukuXgxKm/v1bgk=
X-Google-Smtp-Source: AK7set8Vj+tS4ZZluRc2w0Aa/BI0kDxcLV+H+/9Lz3cLhnDn6dOrIGQcIDsK3JFcmiAC8kMeQ1LBhA==
X-Received: by 2002:ad4:5c6c:0:b0:56e:93b6:27fc with SMTP id i12-20020ad45c6c000000b0056e93b627fcmr11507038qvh.17.1677029385693;
        Tue, 21 Feb 2023 17:29:45 -0800 (PST)
Received: from WQUEN758573.ncr.int.ec.gc.ca (ecodor135.cmc.ec.gc.ca. [205.211.133.135])
        by smtp.gmail.com with ESMTPSA id o190-20020a375ac7000000b0073b45004754sm11872357qkb.34.2023.02.21.17.29.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Feb 2023 17:29:45 -0800 (PST)
From: Philippe Blain <levraiphilippeblain@gmail.com>
Date: Tue, 21 Feb 2023 20:29:17 -0500
Subject: [PATCH b4 1/3] ez: allow iterations to be sent in a single thread
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230219-send-iterations-in-same-thread-v1-1-59b802382eb5@gmail.com>
References: <20230219-send-iterations-in-same-thread-v1-0-59b802382eb5@gmail.com>
In-Reply-To: <20230219-send-iterations-in-same-thread-v1-0-59b802382eb5@gmail.com>
To: "Kernel.org Tools" <tools@linux.kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
X-Mailer: b4 0.13-dev-696ff

Some projects prefer further iterations of a patch series to be sent in
the same thread as previous ones. Usually this means that the cover
letter of v2 is sent as a reply to the cover letter of v1, etc.

Add a new optional argument to get_prep_branch_as_patches, 'samethread',
defaulting to False. When True, add an 'In-Reply-To' header to the first
mail in the series, referencing the Message-ID of the previous
iterations's cover letter.

This functionality will be exposed to users in a following commit.

Signed-off-by: Philippe Blain <levraiphilippeblain@gmail.com>
---
 b4/ez.py | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/b4/ez.py b/b4/ez.py
index 74afddc..dac5e2a 100644
--- a/b4/ez.py
+++ b/b4/ez.py
@@ -1117,7 +1117,8 @@ def get_mailfrom() -> Tuple[str, str]:
     return usercfg.get('name'), usercfg.get('email')
 
 
-def get_prep_branch_as_patches(movefrom: bool = True, thread: bool = True, addtracking: bool = True
+def get_prep_branch_as_patches(movefrom: bool = True, thread: bool = True, addtracking: bool = True,
+                               samethread: bool = False
                                ) -> Tuple[List, List, str, List[Tuple[str, email.message.Message]]]:
     cover, tracking = load_cover(strip_comments=True)
 
@@ -1191,6 +1192,12 @@ def get_prep_branch_as_patches(movefrom: bool = True, thread: bool = True, addtr
     if addtracking:
         patches[0][1].add_header('X-B4-Tracking', thdata)
 
+    if samethread and revision > 1:
+        oldrev = revision - 1
+        voldrev =  f'v{oldrev}'
+        oldmsgid =  tracking['series']['history'][voldrev][-1]
+        patches[0][1].add_header('In-Reply-To', f'<{oldmsgid}>')
+
     tag_msg = f'{csubject.full_subject}\n\n{cover_letter}'
     return alltos, allccs, tag_msg, patches
 

-- 
2.34.1

