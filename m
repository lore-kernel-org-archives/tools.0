Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95B7372
	for <tools@linux.kernel.org>; Mon, 30 Aug 2021 16:46:29 +0000 (UTC)
Received: by mail-qk1-f181.google.com with SMTP id a10so16305856qka.12
        for <tools@linux.kernel.org>; Mon, 30 Aug 2021 09:46:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=0Mu/qp4WWdef6jarX1bV1sELRBW71VOEgIqPMvO0lFY=;
        b=JcJ68ltk2hUYOALKftzEMBmsecjT/tSIJlEaa3T3iEoF662/aEUM5ybLr8g3ALN0NW
         VxGB9TuV6KFxMnGNPrXueyK1qQNYYIRfjj+84k7uqny6dfeJKsL356mgxOETshEng2SC
         QSGRcI94OgVfxzV6wdqyUwIb3sGsarVARZ4LY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=0Mu/qp4WWdef6jarX1bV1sELRBW71VOEgIqPMvO0lFY=;
        b=TPWBm61CH5UG7MLiZaAIrFxOxc2b2LFOluFDhJSgc324isQgBjwAdAwlAuxmt5jsIL
         d5xulTdgtCS86OuvZ2OZthmuho07h3nnOXXQxZ0LtiZsCl5znS1TMq6BaEgcpHXX4AmU
         J/FXY8TPzSuuSLyCu8pxmSMt/3ey5ImJxP3KdOJHExwVvc5WVJPcRyHJ/DAiBGvgl3bp
         zAz2x/FmQITpTZdJlfi7ZdV9YhUrFJ8NNrz6JeHZo6X13ug0xQl4d4qvz7odcD/i7o5D
         EJmZdkI6ktbdl2+wnu29QpqEXywEBnlB7lWFJG0BlxQ0XunT7UvLg8BX9fJ4wLZamWnL
         +pdA==
X-Gm-Message-State: AOAM532OgukSYh77xbKYwRpQ8OnFgIAvnmEp8rbCt+mZHQXrjYwOj/p4
	PKzk58RfDjAhGwAY7SDNWXsntA==
X-Google-Smtp-Source: ABdhPJyoorvtBZA+48Vbgs2poRdB2CoHQSVv2hgM8uvT2l6Y0mp5MP4hI97Me37wViMxBSrORtbCcg==
X-Received: by 2002:a05:620a:1aa8:: with SMTP id bl40mr23505254qkb.180.1630341988477;
        Mon, 30 Aug 2021 09:46:28 -0700 (PDT)
Received: from nitro.local (bras-base-mtrlpq5031w-grc-32-216-209-220-181.dsl.bell.ca. [216.209.220.181])
        by smtp.gmail.com with ESMTPSA id e2sm11440079qkd.2.2021.08.30.09.46.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Aug 2021 09:46:28 -0700 (PDT)
Date: Mon, 30 Aug 2021 12:46:26 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: users@linux.kernel.org
Cc: tools@linux.kernel.org
Subject: lore.kernel.org upgrade: Sep 1, 2021
Message-ID: <20210830164626.tq5emfrht4o46x33@nitro.local>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi, all:

My tests of the new lore.kernel.org service (currently running on
x-lore.kernel.org) are looking good, so I will be putting that into production
on Wednesday, September 1, 2021.

If you're using b4, there will be a version 0.8.0 released on that date as
well, which works better with upstream lore.k.o. changes. Previous version of
b4 will continue to work, but some functionality may be impacted, so everyone
is encouraged to upgrade to 0.8 once it becomes available.

Best regards,
-Konstantin
