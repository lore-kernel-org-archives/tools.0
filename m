Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45C88667F
	for <tools@linux.kernel.org>; Sun, 17 Jul 2022 15:43:47 +0000 (UTC)
Received: by mail-qt1-f173.google.com with SMTP id b21so4072782qte.12
        for <tools@linux.kernel.org>; Sun, 17 Jul 2022 08:43:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=yKW+zf31rAFN+jzbvAm49JrGxEGyFXrOULADD5pr1Rg=;
        b=FVJ7TjpVi8E/QLwEV1Xz160lY1Hc4O0UyGlo213zK8KrrqZAeWN5+vDFReYtGMDLm5
         MVZrcg3n41jPQEZSdG+cfVUlEFa/krOX8y+q0sBJe1Wa5iWR7Ym9aYrMzRf35oJeVWFv
         jub4C8Pnns/oo5mO2JlZlFIswZ3MbcFZRCBgg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=yKW+zf31rAFN+jzbvAm49JrGxEGyFXrOULADD5pr1Rg=;
        b=T7YHnXgG6adyF7Huu9Kq2U7J8s6lVPoXb/KaHhe2bLhGY30ZGu8YRBbdBNvTjbaS3e
         YthU9RRI2qiJWZYUEsqCZWJQp5+lLuENLJLalQM9v+IkwW1krUOXaGkX2InwJSlIBBUc
         qDqrU7Kp75B7XlMSiQdZpJ25xBRxRR9qZ3+9ow3EtsKi6xhx2lEFcs5pZyw9ZdHLNBUY
         GqP7pYhIxHZbj+Wj6V9meaJklvl9yj2CZp1hKZQXsCEgpjNCJHN/rfnbMJ/rqQULZPXn
         KNee9BPY3hYPy2upnqqknqFmtrYhZHwk3evK60oWF4N80OHzAvBjLnJtp76tCHV+oJdS
         iVGA==
X-Gm-Message-State: AJIora9jgn00XR35ojhIG2+Hh6zYvqhcFEE/qUa+xkHHS2zPEsOjhNL0
	FViJvX2MupUmvO8Mx6rrHDvZXQ==
X-Google-Smtp-Source: AGRyM1t6KXYJy+RSbAYHUBMgd2wH/MFE97oZqDLLsbz4BHbswJlf9VRIQXRzPeqx3hUUB04txUPnkw==
X-Received: by 2002:ac8:4e87:0:b0:31e:d0a4:4ba1 with SMTP id 7-20020ac84e87000000b0031ed0a44ba1mr14479943qtp.230.1658072626180;
        Sun, 17 Jul 2022 08:43:46 -0700 (PDT)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-30-209-226-106-245.dsl.bell.ca. [209.226.106.245])
        by smtp.gmail.com with ESMTPSA id j18-20020ac86652000000b00304fc3d144esm7299773qtp.1.2022.07.17.08.43.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Jul 2022 08:43:45 -0700 (PDT)
Date: Sun, 17 Jul 2022 11:43:44 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Conor Dooley <mail@conchuod.ie>
Cc: James Bottomley <James.Bottomley@hansenpartnership.com>,
	users@linux.kernel.org, tools@linux.kernel.org
Subject: Re: b4 submit ready for beta testing
Message-ID: <20220717154344.jnbmklayhjgdekdu@meerkat.local>
References: <20220716142954.voq4ucnl5wkq7h2b@nitro.local>
 <4c4652b0e333bd81b91f71346ac6142322682eff.camel@HansenPartnership.com>
 <20220716145638.ubuwwc7xtjw6ugy7@meerkat.local>
 <6ad8ce3aa0d14d8a09a3c117affe19928a44f639.camel@HansenPartnership.com>
 <d611454a-6a23-eb09-c8ec-84f1b4b49746@conchuod.ie>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <d611454a-6a23-eb09-c8ec-84f1b4b49746@conchuod.ie>

On Sat, Jul 16, 2022 at 06:14:37PM +0100, Conor Dooley wrote:
> >> So, it was either using notes (which almost everyone forgets to push
> >> anyway), or using an empty commit. I agree it's hurky, but it
> >> currently the only thing that fits in the "least likely to end up
> >> lost on a rebase or workstation switch" category.
> 
> 
> Is it silly to suggest that b4 could handle the a notes to
> description & description to notes conversion in a "b4 push-series"
> or "b4 fetch-series" type of command? 

It's not silly, but it's significantly more fragile. Pushing and fetching
requires reachable remotes and some kind of ability to handle conflicts, keys,
etc. I'd much rather avoid going down that road.

-K
