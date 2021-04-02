Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B8E370
	for <tools@linux.kernel.org>; Fri,  2 Apr 2021 00:38:30 +0000 (UTC)
Received: by mail-qk1-f177.google.com with SMTP id y5so4057911qkl.9
        for <tools@linux.kernel.org>; Thu, 01 Apr 2021 17:38:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=BM1S/F++1Ityr4WRYP97CUIXJRuoQ2knAQddz61gNsY=;
        b=MGoHwQIfD8+jQ6LEjoyMWtPCFIZG4zxvRwXbo81Yp0/NX0tv/Za2UU2J/aewPfcQ7K
         t4WxUlPjEvz5ba8CWrlmALWEsPNRVPktNgE8VqwcKW2PWo9L78Wzz0jnkvvRLSov1DMi
         i7b9nzHpEWyGEpZdxFPthQdldmwmAXadK0Ftg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=BM1S/F++1Ityr4WRYP97CUIXJRuoQ2knAQddz61gNsY=;
        b=IaBS5YeaCCl9pN9nze4fy7fXXL/koSLRJ8ftTZ2qEIDGZ2JqGwGK8DNkxfmCekRG1z
         RrQfkJM56Fdac6fGvQd3gUq1L3t2HLFheTxXaUIwsNi1BKG92Iz0I+rJOA+ZIcqmQV8S
         j4HUtPVxXteZbpEBcFPXlf3fBpl5G/vvUuIeijABEdrtBrmRLr7HSKxIpBq1fRQZ/Q3j
         6/0E9o0e+ds4RN5YWCZ74t5Zofoi83b7akLQGhGjmFIKV7qD/s9tnSpAwOTNZEujJ5eM
         U9tqe7vMpa1fUvp+wHLJ5+b745TZKXBzkH15wfXrwTOm0EonSa62KrTkDFCfynVmoINl
         oKzA==
X-Gm-Message-State: AOAM533XKYbHRhjdZIuBFUT5iYy7pkc7E4Uic/8WMkxdIjULwF82AKV3
	LeBJrluFrFEOXE7McZl3Z4sdgQ==
X-Google-Smtp-Source: ABdhPJzuAoBQOOqhom6dC5lMOxNAPIV5mlu6Ly8Do5jEBJjNjMCD8fH8PmR62N4ORnUjNSWZEEcKCA==
X-Received: by 2002:a37:9c4d:: with SMTP id f74mr11441801qke.202.1617323909546;
        Thu, 01 Apr 2021 17:38:29 -0700 (PDT)
Received: from nitro.local (bras-base-mtrlpq5031w-grc-32-216-209-220-18.dsl.bell.ca. [216.209.220.18])
        by smtp.gmail.com with ESMTPSA id g21sm5489086qkk.72.2021.04.01.17.38.28
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 01 Apr 2021 17:38:29 -0700 (PDT)
Date: Thu, 1 Apr 2021 20:38:56 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: tools@linux.kernel.org, users@linux.kernel.org
Subject: Re: [sig-prover] random tarball signature verification script
Message-ID: <20210402003856.qhganuy2xi2zqu6v@nitro.local>
References: <20210401192706.dlsv574jmhvszuq5@chatter.i7.local>
 <CANiq72maNPt60YvRGfjnETn0Q6s_ZXZdyzB_=sxQ0Tz5bmrWWA@mail.gmail.com>
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CANiq72maNPt60YvRGfjnETn0Q6s_ZXZdyzB_=sxQ0Tz5bmrWWA@mail.gmail.com>
User-Agent: NeoMutt/20171215

On Fri, Apr 02, 2021 at 12:16:05AM +0200, Miguel Ojeda wrote:
> > I resurrected one of my previously unreleased helper scripts that I used to
> > run to randomly check signatures on various kernel tarballs. It will do the
> > following:
> 
> Thanks for this! Curious: is it random because it helps avoiding
> others to predict when the checks would be done if run at fixed
> frequency & pattern?

Mostly, I didn't want it always starting from the top of the dir
listing, as that would likely result in some files being checked less
frequently than others. 

It does remember the files that have already been checked within the
same running session, so it should eventually check all of them before
it loops around -- but I think there may be a couple of logic bugs there
that need ironing out for that statement to be 100% accurate.

-K
