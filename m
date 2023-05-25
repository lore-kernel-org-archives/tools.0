Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6515524157
	for <tools@linux.kernel.org>; Thu, 25 May 2023 20:11:12 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-3f611ccd06eso273505e9.0
        for <tools@linux.kernel.org>; Thu, 25 May 2023 13:11:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tessares.net; s=google; t=1685045470; x=1687637470;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZjzF7Q/XIZ1ZCAXWrEeVxv/G/aw3loxJtP27Qy2CZSA=;
        b=OzOaHBWERDWe0hP8ZHPtTWv/Hd8zTmuhIY2olsFtdmOdvk7EyUHpQix2OOQex861Q8
         AOLuaNxtO9khrhGftrrEn3Ta8fE/SxWthqTSgUxv0wGVygz0Pjjj2D4vnHI4/vG3+r2D
         HilV1AqqVo9dBsO6/9AqNE2OHIGdrgWKxgSvkXTonkpFECyYmmV2BlpV4MVXB5ezIMHf
         qonBGI0pVjgFsdGvCkybPyu9HIzm3QU+9UtV3QXjcfuXyaEIEcasyml2tDzgtatC4A6z
         SJ17eFfxOU71rplxQbD68gdf7bYoaMAERshYGBBIPkyr0ahJKeR2MocNbpiW4y7Pg26X
         c/mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685045470; x=1687637470;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZjzF7Q/XIZ1ZCAXWrEeVxv/G/aw3loxJtP27Qy2CZSA=;
        b=Bb9fHbSxjMOihufdg+QcD/VAPiozPqCC9xRsfeluTbSm4m+EW3uRP7idTQyckj0l7F
         jwarA02LAlnDC7A1xWPoJYGLA2+r4skAQDJcdlozFwgBRit2hMhdBXB6H7ALQFOtq0jX
         QMn8V6UXriZ/7s3Vt8bcHw4Gdwn4/qdz+OZCgDCMkURnuhySGTT1wGlqq0IZ8s4LNma0
         cjZVGCKudK1NGqDckmiW2N356U+685v9EbzUJFKwBNN3SHm/GvD1b35nl8EFQ65oJkAH
         xxa0sw7cWYU6rfUS/PHledhSQsT4YF9Y++cLJxYfvpUgWAsFRFJCF5YmpLTBTARTGhTQ
         kutQ==
X-Gm-Message-State: AC+VfDz7inNVf4oZHJc6aMpQ03+NHxKedgwkuIRMM927Vzh8Ec5FAE3l
	11mzSwHqAiVuN6Ubn1qsE/Ca/Q==
X-Google-Smtp-Source: ACHHUZ4g/iIJjdA1qmUX/hr4dUYUhWq0OYY5nsSxnasYhr97QcqE8WbhbmmfUQ+J2Ccw9xYTPp+MmA==
X-Received: by 2002:a5d:564e:0:b0:309:48b9:977b with SMTP id j14-20020a5d564e000000b0030948b9977bmr3105843wrw.22.1685045470276;
        Thu, 25 May 2023 13:11:10 -0700 (PDT)
Received: from vdi08.nix.tessares.net (static.219.156.76.144.clients.your-server.de. [144.76.156.219])
        by smtp.gmail.com with ESMTPSA id f6-20020adff986000000b00306281cfa59sm2802772wrr.47.2023.05.25.13.11.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 May 2023 13:11:09 -0700 (PDT)
From: Matthieu Baerts <matthieu.baerts@tessares.net>
Subject: [PATCH b4 0/2] trailers: accept recognized link trailers +
 "Closes"
Date: Thu, 25 May 2023 22:10:35 +0200
Message-Id: <20230525-closes-tags-v1-0-ed41b1773cb6@tessares.net>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALvAb2QC/x2NQQqDQAwAvyI5G7Dp7qF+RTxk16iBdi2JlIL49
 649DsMwB7iYikPfHGDyUdetVLi1DeSVyyKoU2Wgju5dpIj5ubk47rw4hsdEkdMcMgWoRWIXTMY
 lr1fzYt/FLvE2mfX73wyQAozn+QNUuKXpegAAAA==
To: "Kernel.org Tools" <tools@linux.kernel.org>
Cc: Nick Desaulniers <ndesaulniers@google.com>, 
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Matthieu Baerts <matthieu.baerts@tessares.net>, 
 Follow Upper <follow.upper@example.org>, 
 Cover Upper <cover.upper@example.org>, 
 Test Override <test-override@example.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1072;
 i=matthieu.baerts@tessares.net; h=from:subject:message-id;
 bh=J+RYU4fOzsex4BNKd8Ktg024VKDqhihORnWccD5uBFw=;
 b=owEBbQKS/ZANAwAIAfa3gk9CaaBzAcsmYgBkb8DdUC7H4Ueooz9gO7wS9ZQqg17rRXo4oa2Li
 BElIY+geKqJAjMEAAEIAB0WIQToy4X3aHcFem4n93r2t4JPQmmgcwUCZG/A3QAKCRD2t4JPQmmg
 czowD/9xK9mndrfgiQW40P0QXBnwxHxPaGhrrbJ6XGB387/e0sZKwbM1P58MBigP/H++1vaBZBp
 6K8bYZOVaBoOd4q4fFbUzeFs6h/lM66VqHmgK0yd4xr5ek8kzwRFQNdpYeHIIog7YseICE6l4GW
 IQ9r7tWNiaKeN63BYf+tkwUxfFRkGrninIIWqzm1GkaSLpbzOxy2EIKSIyD1lChjl+qw+m5z6yN
 K8g+DWhTAAV6gabEOYg27a1U9vP18vuj5g65T13D1pKIzPO1EQCBJ/BOkbJqk91Optj/6Hvg6CB
 1Zava9FT08LiApauLlhIij6JEmPu4W+xXhfzh0K9Sy3pxG3gNlw72Kh96h4hQU6JjeTyXfFGPwn
 7ECrS61BpI1LUnHA7sV+rEI0/UgqJCUkrJ5BA6+Y8cbu/rhLyRTZMt5sksSh4x3U+sgn6QaiB98
 IOxxwTBkf5Hnki961il/t+0tNQVj///JDfXq8npSNEf3ovSsnnR7z1+FCByY/n9WnSkj1jYAb+6
 7h/RHj7tp2yFmsJ1xQmnYlSOOV50+D0Z+V3ltfcsJfDBdr+ljh90nHcRkK3msWjPz/Vx7u/XUCH
 HLtO04hFieMnt1hytMYA/Q0iMO1KZp3fMHaFaLJ++2OArhdAutd6gcOb2MIqXgqn9ZtAGV/wM8N
 Of60QzLulfl3JUA==
X-Developer-Key: i=matthieu.baerts@tessares.net; a=openpgp;
 fpr=E8CB85F76877057A6E27F77AF6B7824F4269A073

Nick reported in [1] that Closes tags were not picked up by b4 when
updating trailers.

In fact, it looks like that even Link ones were not picked up. (Or at
least it was not working when I was testing it :) ).

With this series, Link, BugLink and Closes tags are now automatically
added when available in follow-up comments.

Link: https://lore.kernel.org/all/CAKwvOdm=Zk8YhrPptN3k7UQo+1n7Ws=Qox=BwTR9bbjPJJYz8A@mail.gmail.com/ [1]
Signed-off-by: Matthieu Baerts <matthieu.baerts@tessares.net>
---
Matthieu Baerts (2):
      trailers: accept recognized link trailers
      trailers: add 'Closes' as recognized link trailer

 b4/__init__.py                                           | 8 +++++---
 tests/samples/trailers-thread-with-cover-followup.mbox   | 2 ++
 tests/samples/trailers-thread-with-cover-followup.verify | 2 ++
 3 files changed, 9 insertions(+), 3 deletions(-)
---
base-commit: bfdf5b3b0835c8c351abbcd9b3b5268acf6545fa
change-id: 20230525-closes-tags-49d25abf4c24

Best regards,
-- 
Matthieu Baerts <matthieu.baerts@tessares.net>

