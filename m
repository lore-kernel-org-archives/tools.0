Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A04F7483
	for <tools@linux.kernel.org>; Tue, 21 Jun 2022 20:06:44 +0000 (UTC)
Received: by mail-qv1-f54.google.com with SMTP id q4so9969606qvq.8
        for <tools@linux.kernel.org>; Tue, 21 Jun 2022 13:06:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=G72VxKgwiKjo63Bd+THob3l0bY6lkERjRSC0TGVW2N4=;
        b=ge393BwigrfcTCONLRsl4Yffx0WhgNKw+0NAYRriHT10mLwTTsjInFONdzBUItrg7d
         AunmZc8hiWQbRWIaREi8R+icoqOpgR7IzpagF4xX+ND3/FolJ7XzJ5dJFtBjrQrtArYU
         Hp+GE4OFLbl9lp4dXI0CvdH1XZvoVedgDxhLI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=G72VxKgwiKjo63Bd+THob3l0bY6lkERjRSC0TGVW2N4=;
        b=MdB5su131OV+dFLpNhFt/KeEYQNGKuXJ9vZ2rdxyJRSwySKhJziUY7K1Sl1l8vYlZI
         z4hUnUArYhE4X1rGiifoehV1G+sdkV3wzlXDhDH2Aciff4xEcdnCNoImh6Mc2yBT+uJW
         /0CKSoSNYTJJ5CkS5R6UEpXZlJ1DVA0s/sdSQf3TzTne1jCXKeoJxItjRxPYWNpb45pN
         EWSP8qN5/CuZEXAgOkhDLdQEDXoDLJSg3WJNeGrg0efvjgtSsSxVMNJ/9qpvJn9dG/Zy
         Tu+NhSTR9scrsKdBrsfp/ySg1GDBSNLCR8t8y0aJrDyZejIPSImjSaKZQE/H2QkdaXPl
         pINw==
X-Gm-Message-State: AJIora9yN4fU3qj5nvp8bCw54rx3a92OsQTEE1oky8LseF+ZdTkxnZfd
	AIIcDptXBSlxvawtig69MLRIdjgHOeVhcQ==
X-Google-Smtp-Source: AGRyM1va58XEhRqpZcrtiwWthzjIxjibzMYVGc+mWA5uFDZI+nlpAA3tuo5RAMQGAEcGDVp1kPxkRA==
X-Received: by 2002:a05:622a:81:b0:304:ea54:ae89 with SMTP id o1-20020a05622a008100b00304ea54ae89mr25964486qtw.172.1655842002438;
        Tue, 21 Jun 2022 13:06:42 -0700 (PDT)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-30-209-226-106-245.dsl.bell.ca. [209.226.106.245])
        by smtp.gmail.com with ESMTPSA id bs18-20020a05620a471200b006a32bf19502sm15010166qkb.60.2022.06.21.13.06.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jun 2022 13:06:42 -0700 (PDT)
Date: Tue, 21 Jun 2022 16:06:40 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
	Linus Torvalds <torvalds@linuxfoundation.org>,
	tools@linux.kernel.org, users@linux.kernel.org
Subject: Re: b4-0.9.0 available
Message-ID: <20220621200640.7kczqkwwap2wehsy@meerkat.local>
References: <CAMuHMdWz8=Zr8hnXNGBZVfe70F8oVdK670Z41=Dtib0GMDgAug@mail.gmail.com>
 <CAHk-=wiQzp+aurcmj15=LAa2ntvRZH0Ee2dn-PLjcFpmRE6Jcw@mail.gmail.com>
 <CAHmME9p+zRErOsvA1zC=kTHtpYD_sGjFxVsj0pMwteAp4dCdjQ@mail.gmail.com>
 <20220621165953.z25hwos7gom6bp6s@meerkat.local>
 <YrIEnmt5vDMcbOiG@zx2c4.com>
 <20220621182953.p5asczznnz3pn6dl@meerkat.local>
 <YrIR2v7GdC3qIt2E@zx2c4.com>
 <20220621192724.ls6q6fyr6ehtsyah@meerkat.local>
 <CAMuHMdU1EZ9vwyOec6EKGaW=Ghy_p5D0dbcun24BqoSok6maLQ@mail.gmail.com>
 <YrIg+vV8YMVrhHME@zx2c4.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YrIg+vV8YMVrhHME@zx2c4.com>

On Tue, Jun 21, 2022 at 09:50:18PM +0200, Jason A. Donenfeld wrote:
> On the contrary, the thing you want is a service where you paste a
> commit and you get a LKML thread. That sounds like something lore could
> grow, or any other service that has that database handy. And it could do
> it *better* too, since it could show multiple matches sorted by
> relevance and matching distance to the actual git patch.

FWIW, this is something we should be able to do on git.kernel.org soon -- a
commit view will add a link to look up that patch on lore. The backend changes
for public-inbox to add automatic indexing on "git-patch-id --stable" just
landed in the past few days. I just need to figure out if I can do this sanely
with cgit -- and if I cannot, then at least all the guilty parties are already
here to add the necessary bits in. :)

-K
