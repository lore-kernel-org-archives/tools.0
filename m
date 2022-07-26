Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15BC52590
	for <tools@linux.kernel.org>; Tue, 26 Jul 2022 14:54:12 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id a11so8898655wmq.3
        for <tools@linux.kernel.org>; Tue, 26 Jul 2022 07:54:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=GeezJ+ERQjDiDfzjK9fkXCzjcojTivk9d/XTj7sJr/Y=;
        b=71ZQeSPXlKOA6AGWu5FoPjwZMhO2Y5BxRtTcB2uEBrGCW2HwLY5dbj9lfzztm8EfW2
         qsdrJH3EqYP+ec5Hu5cD3zJodw6UhtsHBFGnLtJHiAdeHnbgeb9LyEmpXUpNin+i5E9P
         YM3uzJwqxaGMeba646FzpFxNmm13ikukHwn7VxNgVnLFBg28C6LqMqrvwS7l0xByTiBD
         qFj+o/O1bJVRHmxoPwTDrSp04+TSNHRHl2CswGlvIRKQqCD7n5XXCVnHkXARsJnVIlJ1
         KEDLqLFpnPTSOEHiOVZN2yfmq5YZ1eSk/4FvPI9/T5GohqWJRG2RPreOLTq4w9q6HlNw
         Nr8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
         :message-id:mime-version;
        bh=GeezJ+ERQjDiDfzjK9fkXCzjcojTivk9d/XTj7sJr/Y=;
        b=IfuEGb4TZnFUBc92NJHKWGUuH5BVT5NhcU4caCRm7lswFnZnmJbJ8Kk7/TNTKvF7dZ
         3sosZcjQJj1VhPtGAe/XzB4WjJuO3wZKSO0kcR3ZugWL/3d5pKgwDX2LNZp5KNhOuBM2
         ojnKfamcu+o4Ey2/FhpNBpEe6XweNOXoTBs11i0BtM8qeC1JEG1y6zMOxy4ns6hvXQbZ
         G2gIOOJhtrhKluSvV7VCbPh2e0Zm4msLH9yTermZUXUmuDwISSrO0iLBE2gbzDOeyDZk
         h0imy5IRtku/yYmwuqauTAAN69+QP0SBk/soA1e0pQ9UOS+AR44TtLeWmY4Tb91XWgNA
         Zy8Q==
X-Gm-Message-State: AJIora/YdQ4736gvOSUZDC039ras4X3cU74qzsZfhSx0RHVfASesiacH
	zA7YHYTuKfG4KBllH5ZcMtfK0w==
X-Google-Smtp-Source: AGRyM1up6rv7WgGMTR+snbfsOS4Xzhb3SBtSo0twrVHRu9drVI00Jh3OSzlepOSRopWMjwg8FlC3Pw==
X-Received: by 2002:a05:600c:64a:b0:3a3:25d5:fa5 with SMTP id p10-20020a05600c064a00b003a325d50fa5mr12076133wmm.125.1658847251168;
        Tue, 26 Jul 2022 07:54:11 -0700 (PDT)
Received: from localhost ([82.66.159.240])
        by smtp.gmail.com with ESMTPSA id bo27-20020a056000069b00b0021e51c039c5sm14319506wrb.80.2022.07.26.07.54.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Jul 2022 07:54:10 -0700 (PDT)
From: Mattijs Korpershoek <mkorpershoek@baylibre.com>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: users@linux.kernel.org, tools@linux.kernel.org
Subject: Re: b4 submit ready for beta testing
In-Reply-To: <20220726142743.dllhmbivtb2yk4uk@meerkat.local>
References: <20220716142954.voq4ucnl5wkq7h2b@nitro.local>
 <20220720184835.uhnkucai54alhgo6@nitro.local>
 <87pmhs1d8h.fsf@baylibre.com>
 <20220726142743.dllhmbivtb2yk4uk@meerkat.local>
Date: Tue, 26 Jul 2022 16:54:09 +0200
Message-ID: <87bktbapri.fsf@baylibre.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Tue, Jul 26, 2022 at 10:27, Konstantin Ryabitsev <konstantin@linuxfoundation.org> wrote:

> On Tue, Jul 26, 2022 at 10:37:18AM +0200, Mattijs Korpershoek wrote:
>> > 2. "b4 submit" command got split into 3 different commands:
>> 
>> While I do agree that these commands make life easier, I don't think
>> that we should "ez-" as a prefix.
>> 
>> The "ez-" part has, in my opinion, no added value for users. It
>> assumes that using these commands is so easy that "you can't use it,
>> you're really incompetent". I think we should use more "neutral" langage
>> for commands (without judging if it's easy or difficult).
>
> Yeah, ez- is a gimmick and may not stay. It's easy to type and tab-complete,
> though, which is why I went with that (not that tab completion bits are done
> for b4 yet).

Ok. I really think it should be removed because it gives a judgment on
the user. For some folks it's also "easy" to "just use git send-email".

>
>> How about:
>> - b4 series (for creating/handling series. Also includes "send"/"submit")
>
> I think that makes it hard to distinguish from "b4 am/shazam" that also
> operate on series. In my mind, the command should indicate that it's
> specifically for working on series for submitting them upstream as opposed to
> for retrieving series for inclusion into your repos.
>
> Perhaps "b4 prep"?

Understood. series is indeed ambiguous and "prep" or "prepare" seems
more appropriate.

>
>> - b4 trailers (for handling trailer updates)
>
> Okay, since one of the plans is to add a way for maintainers to quickly send
> their own follow-up trailers, e.g.:
>
>     b4 trailers --ack [--trailer 'My-Trailer: Foo Bar <eml@addr.foo>'] <msgid>
>
> this would allow defining keybindings in mutt to quickly submit an "Acked-by"
> or any other trailer.

That looks awesome :)

>
>> >         b4 ez-send --no-auto-to-cc --dry-run
>> 
>> In my opinion, "b4 send" should be part of series because we cannot send
>> series that were not created with "b4 series".
>
> It won't be limited to just series, though -- you'll soon be able to send pull
> requests as well, and that will accept arbitrary tags. So, I intend to keep it
> separate from "prep".

Ok. I did not think about the pull requests part (I'm an
occasional contributor). It makes sense to keep them separated.

>
> Thanks for your feedback!
>
> -K
