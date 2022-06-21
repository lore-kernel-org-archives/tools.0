Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E54C53D8B
	for <tools@linux.kernel.org>; Tue, 21 Jun 2022 16:59:56 +0000 (UTC)
Received: by mail-qk1-f176.google.com with SMTP id o73so10575548qke.7
        for <tools@linux.kernel.org>; Tue, 21 Jun 2022 09:59:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=DdcytVhkzh8rsLwR1vXmFsN5K5lc9jUkZnEC1jeFhNc=;
        b=iDRxf5i475uhChlmJHEzXg59hSIffmyZ1tD7WtMPRrx1/0IDMfMl3r7ZJXsKAOJufK
         2ZTRhIjcybYMyBwonEiImHc7p8IGMKcU9PBSmNnKN2iDGu4buvoCZukWxkE2RoOXha3+
         jpuO7VSyujNK7BE0ueadznu7bpS5VO6ZfBqO0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=DdcytVhkzh8rsLwR1vXmFsN5K5lc9jUkZnEC1jeFhNc=;
        b=theMRy1Aj5H78suWdO1293N7ebbryH5S6WSqeT3fmjW5BeaE9XiVbEHzCQN2qzPGsa
         f5GtxtPbwntgKJfNsL096FCQrOPHmY7qjfTXa0+GMVffxaeYg+c50pTlM/E0GFjfDa8V
         H9j1Cisu3FJP+0JkjUKUanfggblbHqEaEiBrxjgCY+fDXa5zRka4cGk1vj8AMgy9bZgt
         Tjybiiw1rPC667VKOqE9EO18ksTtQjUA7V61DQ19Qzuuc7EGgnLW0QbHX0R3YLO/XZnD
         je24zTEr50vsfG1jEVs0soqjAfYgHwmGI04TEWf0iWFSnO1Y7WDkFP6VHPDaS2R0CfCS
         MY2w==
X-Gm-Message-State: AJIora+m1xK+WEgc3R5u6wgfQcSnMRokwa7VfU2gHBkwWzoCnrtBEBcf
	y4lBLPuG2Xg6QdqSFO4IWsjgl8xEMC8p1w==
X-Google-Smtp-Source: AGRyM1vV5F/Bxq40C7cSV0z8iM9hkJLzm/rptSvzEJKHqipcxR3Xpum3+QEBcXd3UmWCarBiDzByVg==
X-Received: by 2002:a37:a757:0:b0:6a6:8f5f:3af2 with SMTP id q84-20020a37a757000000b006a68f5f3af2mr20525512qke.49.1655830795630;
        Tue, 21 Jun 2022 09:59:55 -0700 (PDT)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-30-209-226-106-245.dsl.bell.ca. [209.226.106.245])
        by smtp.gmail.com with ESMTPSA id m14-20020a05620a290e00b006a6b498e23esm15542943qkp.81.2022.06.21.09.59.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jun 2022 09:59:55 -0700 (PDT)
Date: Tue, 21 Jun 2022 12:59:53 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: Linus Torvalds <torvalds@linuxfoundation.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>, tools@linux.kernel.org,
	users@linux.kernel.org
Subject: Re: b4-0.9.0 available
Message-ID: <20220621165953.z25hwos7gom6bp6s@meerkat.local>
References: <20220617190153.tvi5lkzlvemeqou5@meerkat.local>
 <CAMuHMdV4AHH1TM6xf26MP0-dUQ0-fB+62GeeuVuth9pgWgdu7Q@mail.gmail.com>
 <20220621152903.czivp7fdn6me775i@meerkat.local>
 <CAMuHMdWz8=Zr8hnXNGBZVfe70F8oVdK670Z41=Dtib0GMDgAug@mail.gmail.com>
 <CAHk-=wiQzp+aurcmj15=LAa2ntvRZH0Ee2dn-PLjcFpmRE6Jcw@mail.gmail.com>
 <CAHmME9p+zRErOsvA1zC=kTHtpYD_sGjFxVsj0pMwteAp4dCdjQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAHmME9p+zRErOsvA1zC=kTHtpYD_sGjFxVsj0pMwteAp4dCdjQ@mail.gmail.com>

On Tue, Jun 21, 2022 at 06:03:30PM +0200, Jason A. Donenfeld wrote:
> Very much so. But if you look at various commits from the last 2 or 3
> years, this is now disregarded pretty regularly. It'd be nice to see
> the tooling preventing this kind of error rather than encouraging it.

The default for b4 since version 0.6 (2020) has been not to preserve the
existing trailer order and append any new ones at the bottom.

-K
