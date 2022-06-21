Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C49B1397;
	Tue, 21 Jun 2022 16:03:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98BA8C341C0;
	Tue, 21 Jun 2022 16:03:34 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="pMhSJHaC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1655827412;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MxllftfDG3iLgaiuQBadcpknul/TGM8L/v42q+zKsLk=;
	b=pMhSJHaCXS6fS0RA5lmOijN/B5hUVfUggEMWbM+GjMgHCXeT66CN7MGh73EsMUbBPh69kp
	Zk29eYfb1fq5qcDi6pKdBDrlCmKYnj7jb1+Nnd9RFs7U1Zq+dBOxvScpVXmaG3X/2vUa59
	MawMqHv7qpSA8pRPoyYpN4NMglSKYyE=
Received: 
	by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id b266f0ec (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO);
	Tue, 21 Jun 2022 16:03:32 +0000 (UTC)
Received: by mail-io1-f50.google.com with SMTP id l24so2188856ion.13;
        Tue, 21 Jun 2022 09:03:32 -0700 (PDT)
X-Gm-Message-State: AJIora9D+UrY7MlnvKUso6pl75oqPmI2CsszREcjYYV+qejE+Y+ODRnT
	PLlVMJFIh5b1xykHvEWiEdHlIZTqrWMMz933lKg=
X-Google-Smtp-Source: AGRyM1s7ZCORawKAS3Hbz4BsrF5uba6XUXn370SQBWn9UgnJEoBXcnvnu8CZ6QjCZbTjNLphPVxtBfVpU+cbBr0THAU=
X-Received: by 2002:a05:6638:2113:b0:331:feae:af81 with SMTP id
 n19-20020a056638211300b00331feaeaf81mr16275530jaj.196.1655827411051; Tue, 21
 Jun 2022 09:03:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Received: by 2002:a05:6e02:791:0:0:0:0 with HTTP; Tue, 21 Jun 2022 09:03:30
 -0700 (PDT)
In-Reply-To: <CAHk-=wiQzp+aurcmj15=LAa2ntvRZH0Ee2dn-PLjcFpmRE6Jcw@mail.gmail.com>
References: <20220617190153.tvi5lkzlvemeqou5@meerkat.local>
 <CAMuHMdV4AHH1TM6xf26MP0-dUQ0-fB+62GeeuVuth9pgWgdu7Q@mail.gmail.com>
 <20220621152903.czivp7fdn6me775i@meerkat.local> <CAMuHMdWz8=Zr8hnXNGBZVfe70F8oVdK670Z41=Dtib0GMDgAug@mail.gmail.com>
 <CAHk-=wiQzp+aurcmj15=LAa2ntvRZH0Ee2dn-PLjcFpmRE6Jcw@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 21 Jun 2022 18:03:30 +0200
X-Gmail-Original-Message-ID: <CAHmME9p+zRErOsvA1zC=kTHtpYD_sGjFxVsj0pMwteAp4dCdjQ@mail.gmail.com>
Message-ID: <CAHmME9p+zRErOsvA1zC=kTHtpYD_sGjFxVsj0pMwteAp4dCdjQ@mail.gmail.com>
Subject: Re: b4-0.9.0 available
To: Linus Torvalds <torvalds@linuxfoundation.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, 
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>, tools@linux.kernel.org, 
	users@linux.kernel.org
Content-Type: text/plain; charset="UTF-8"

On 6/21/22, Linus Torvalds <torvalds@linuxfoundation.org> wrote:
> On Tue, Jun 21, 2022 at 10:41 AM Geert Uytterhoeven
> <geert@linux-m68k.org> wrote:
>>
>> FWIW, I follow the chain-of-custody ordering.
>
> I don't think different kinds of links have any particular ordering,
> but yes,the "Signed-off-by:" ones should basically be sorted by
> "author -> email chain -> committer" order so that you can see which
> actual "path" the patch took.
>

Very much so. But if you look at various commits from the last 2 or 3
years, this is now disregarded pretty regularly. It'd be nice to see
the tooling preventing this kind of error rather than encouraging it.

Jason
