Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04BC13D8E
	for <tools@linux.kernel.org>; Fri, 28 Apr 2023 18:46:16 +0000 (UTC)
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-3ef59098519so1037831cf.1
        for <tools@linux.kernel.org>; Fri, 28 Apr 2023 11:46:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1682707576; x=1685299576;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Q35ThzbJ8FLNEI8A4/+nIgDhi2yg0y85oyfxLkE+Vwg=;
        b=LNHLm/qhBCe22ka/6HSOo3yfMhw9FXgbk131NpMZ1QLDYZIuxkbbwGgtRn2MM1VUIM
         Q/8TcpI9qe+LQQZw4BthHejslR83TSD4Z5AFjRrkQyS67RWDKHkgeJH6rOor7SurCaXk
         U6rHP3iG+FQXeBv4hWSg4AD7rEHPfxB1isCIk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682707576; x=1685299576;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q35ThzbJ8FLNEI8A4/+nIgDhi2yg0y85oyfxLkE+Vwg=;
        b=Qz+Zta0XNkXoA+bIdPBvKczJH5E+O18rbam90Fh5kJc79dMDILxzFAdD4DWVEdcpq3
         xTZu9buNIChJ+JXRRy9dgWgEGjprVbJxT9Dd0oayazg3m4Ogj2FTx9FA9hMWlFKcl8fl
         AIT0BaKDmEQljVECxArjnQnrDrfrBpgH+zXYM/VSZlB1NfuuyIpXveh/SRKoNLmgztQN
         ONj2z4sDfMO2dBR8OAmFRlg5GjiT/Yw6ON1u0LcErzqTe1sdXRqMlX6PS3pYy498q0Ft
         HoBNVY9YvIciMwfGBT5+To6e7LKfh55a5f/wotmY1w0itPGl7Si5xseO8vP1w2j5ZFvx
         Hduw==
X-Gm-Message-State: AC+VfDyVpKHaUxgjS8vyVwm3M3iqoxBlUa40fYTBBqBNiZEWJA+vYiJT
	bcSaM74eYDdfViKYaLJwK5WNmQ==
X-Google-Smtp-Source: ACHHUZ7wlcb7QOxXy1bIXE++pY0nqcZQeV8x/ZTTA2AvrYSvJzeYnzcrbi0ZiI8vqyEI8WOzxVnoDg==
X-Received: by 2002:a05:622a:1890:b0:3dc:fa58:97fd with SMTP id v16-20020a05622a189000b003dcfa5897fdmr10919372qtc.25.1682707575908;
        Fri, 28 Apr 2023 11:46:15 -0700 (PDT)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-30-209-226-106-132.dsl.bell.ca. [209.226.106.132])
        by smtp.gmail.com with ESMTPSA id e21-20020ac84e55000000b003bd0f0b26b0sm7262247qtw.77.2023.04.28.11.46.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Apr 2023 11:46:14 -0700 (PDT)
Date: Fri, 28 Apr 2023 14:46:12 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: icon@mricon.com, tools@linux.kernel.org, mjg59@srcf.ucam.org
Subject: Re: executable sendemail.smtpserver and b4 --reflect
Message-ID: <20230428-guidance-unvented-692ee1@meerkat>
References: <CAKwvOdn6_J+9BppRbXEtDc8CW-qqoat7VJ521oWnqXCXHb_d6A@mail.gmail.com>
 <20230419-closure-polymer-f7a6ac@meerkat>
 <CAKwvOd=h2TeX6_WqHtK8Tf1MqmOB_ao+JfJpnoSmwXUB0qkaug@mail.gmail.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAKwvOd=h2TeX6_WqHtK8Tf1MqmOB_ao+JfJpnoSmwXUB0qkaug@mail.gmail.com>

On Fri, Apr 28, 2023 at 11:34:23AM -0700, Nick Desaulniers wrote:
> > I don't think it's b4 that is doing this. I think Matthew mentioned that
> > sendgmr will rewrite some headers to match your internal authentication,
> > perhaps that's what is replacing the From: header?
> 
> I see:
> 
> $ b4 send
> ...
> Sending via "/usr/bin/sendgmr -i -f ndesaulniers@google.com"
> 
> Should this be using `/usr/bin/sendgmr -i -f 'Nick Desaulniers
> <ndesaulniers@google.com>'`?

No, the addresses passed via -f are for the envelope-from, not for the message
headers (the envelope-from is used during the SMTP negotiation and this is
where the message should bounce to if it's not delivered).

That said, I don't know how sendgmr works internally, and since it doesn't
claim to be sendmail-compatible, the flags and how it treats them can be
anything, really.

-K
