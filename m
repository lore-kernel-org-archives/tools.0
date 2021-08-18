Received: from mail.zx2c4.com (mail.zx2c4.com [104.131.123.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F4C9168;
	Wed, 18 Aug 2021 19:16:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1629313765;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bJM0jHZIx7/9djllZ8CnAITXsoGfXHtcbDrv/6VRa9c=;
	b=EFxpLDkHf0s4/a58is3ED5j4E/NxDLqae5G0nHW/Lqr0Bz/MsYn7T2CWb+q3HTT+tUxczX
	HmvvVGzge57V9VTQJPckUSFdqVyrrcFD+4XuB2/z4gqlSyS63o6oMiCUIFz7Nhovj+dP7e
	HoPTywBCVHfXKcF1F8h/PxGpUyQJ3BM=
Received: 
	by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id a55c7539 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO);
	Wed, 18 Aug 2021 19:09:25 +0000 (UTC)
Received: by mail-yb1-f170.google.com with SMTP id r4so7313980ybp.4;
        Wed, 18 Aug 2021 12:09:25 -0700 (PDT)
X-Gm-Message-State: AOAM533BW3zjHN4ValN7sxlUqRsqzWzYs8RB5+m2Cw7oBDDaAYVOGsOq
	6MatScm2kTAjHmZTJaEJqdSEG8E+8Bc77U8XpWY=
X-Google-Smtp-Source: ABdhPJxnGsQApek7ERDN2dEAiYkmqEXkEEIaLddHaePJ9oUasq1L8rCaqT7IJWLj8vyakMmjp7crRArXNAjSA9BbQjk=
X-Received: by 2002:a05:6902:154a:: with SMTP id r10mr9821633ybu.456.1629313765027;
 Wed, 18 Aug 2021 12:09:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
References: <20210818190750.g3xedu7j24sqndo2@nitro.local>
In-Reply-To: <20210818190750.g3xedu7j24sqndo2@nitro.local>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 18 Aug 2021 21:09:13 +0200
X-Gmail-Original-Message-ID: <CAHmME9qz08XYyrofJOU9TYvgZ2tB39GaaxQrVz1-wiuGRgB6fQ@mail.gmail.com>
Message-ID: <CAHmME9qz08XYyrofJOU9TYvgZ2tB39GaaxQrVz1-wiuGRgB6fQ@mail.gmail.com>
Subject: Re: New version of lore available for preview
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: users@linux.kernel.org, tools@linux.kernel.org
Content-Type: text/plain; charset="UTF-8"

Planning on having /linux-kernel/ be canonical, with /lkml/
redirecting to it, for x-lore?
