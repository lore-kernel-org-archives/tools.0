Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A31C8480
	for <tools@linux.kernel.org>; Fri,  4 Nov 2022 17:13:43 +0000 (UTC)
Received: by mail-qt1-f171.google.com with SMTP id x15so3397360qtv.9
        for <tools@linux.kernel.org>; Fri, 04 Nov 2022 10:13:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HTndpNwRdq7zNuYUCN3LNi3zDLxHeFijt9GEdVdsVDA=;
        b=SJRgTiWF8MaGlF30E2oJaNaTOj5J/FN1r0G1I+Bhmao7rhKvh3M+S4bz1sjCe7d6gE
         trW9UnwqSUnbBliW7ZTNsawAnq94p73eOoHS28H5cw1e6BLcOh56x0V9efeoH84/BfLF
         Bb8Y82Cu1eeIkHL6ClJgJub1tGTxUhpCyaa8c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HTndpNwRdq7zNuYUCN3LNi3zDLxHeFijt9GEdVdsVDA=;
        b=sEoY1qVJw4PbE8w3ZbhpJaQpFsPYpZyUjUYizdTZosiNiOfPmklxuq5glYY7Jgdjs+
         kQmLd4P6Y3T4tYQBHPn2BMbWWpn2s7Eh10+qJRXZlPkvIx4UI4lz8rUp9nHaiKEnr3zn
         pzlF2Z7GZSGF5a4fOzPtE9Mv4olaOIc8Sth0py7ddVMy1/bg3ewWQlwCLP4i2uEmPg7j
         EgkbvQj8wYWDZ35/p7cuBSMEGoopAeLQIDXmXBNmNUBFq43VZPXQC+zZmeizvpCa3TK9
         NgpSMClQx2kUoxS4yvTTzbcyI8pgfMxOZEUbcVg3oGcOfRMFSmlDfnHimkOxWbPYqe4y
         IebQ==
X-Gm-Message-State: ACrzQf1rMBt6Yu6MdPoAVG2xVbaCGXLwij7kuTbIN4NU5qBhclRFl7Fs
	u08CO5Ld7h6vzFq9ibHGh0+jkw==
X-Google-Smtp-Source: AMsMyM5IY1I58USgS3CMjgeoAdV5QAMb7FjUYjed/7amw+dslRHUyTvUWOBrWmBmIFEnl26s2Q3+AQ==
X-Received: by 2002:a05:622a:589:b0:39d:a2f:b92a with SMTP id c9-20020a05622a058900b0039d0a2fb92amr30101441qtb.664.1667582022402;
        Fri, 04 Nov 2022 10:13:42 -0700 (PDT)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-33-142-113-79-147.dsl.bell.ca. [142.113.79.147])
        by smtp.gmail.com with ESMTPSA id j6-20020ac85f86000000b00397e97baa96sm2885432qta.0.2022.11.04.10.13.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Nov 2022 10:13:42 -0700 (PDT)
Date: Fri, 4 Nov 2022 13:13:40 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: tools@linux.kernel.org, users@linux.kernel.org
Subject: Re: b4 prep and --manual-reroll
Message-ID: <20221104171340.ilq22prnm2kbyjrn@meerkat.local>
References: <Y2ScVwTlqH/zz36J@google.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Y2ScVwTlqH/zz36J@google.com>

On Thu, Nov 03, 2022 at 10:00:07PM -0700, Dmitry Torokhov wrote:
> Hi Konstantin,
> 
> Somehow "b4 send -o dir" followed by "git send-email ..." managed to
> produce quoted-printable cover letter message (see
> https://lore.kernel.org/all/20221103-omapfb-gpiod-v1-0-c3d53ca7988f@gmail.com/)
> and that confused "b4 prep --manual-reroll ..." as this produced a tag
> that had "=0D" as line ends. I was able to work around it with the
> patch below (not sure if this is right thing to do)...

Ah, yes, quoted-printable is the bane of my existence. Thank you for reporting
this. I think a better way forward is to get away from get_payload(), which is
a legacy method that I kept around when we cared about python3.6
compatibility. I'll comb the codebase for a better solution.

> Also, doing "b4 send --resend" with this series did produce double
> signature on the cover letter, even though I see in the code it tries to
> remove it.

I'll poke at it -- thanks for testing that out. I'm pretty sure you're the
first person to actually use it. :)

-K
