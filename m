Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85F612FAE
	for <tools@linux.kernel.org>; Wed,  1 Sep 2021 13:44:08 +0000 (UTC)
Received: by mail-qv1-f52.google.com with SMTP id z2so1437931qvl.10
        for <tools@linux.kernel.org>; Wed, 01 Sep 2021 06:44:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=y/0H8kZvrElMfAg5d/PCflQCVLh3b7IoMZrYKKgF6f0=;
        b=VNMOu04CVjNL+N2r05BdJhVQkalbpxcp+HL2wSwtj5aoE5NtRZLeysqRo/NzIrXwiv
         gLrr//0dHY/5SKTPjlAOYcMA6y7THbMxRsm973cM+cEoWXZG/pUckUK5kmicIlBvjZta
         tkeZJLl2gxxFTDXJ0jF2LeW+3Ryxnh+YQCaHM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=y/0H8kZvrElMfAg5d/PCflQCVLh3b7IoMZrYKKgF6f0=;
        b=Po85pBOoSO1eubDQSjLVV6xkW+l+Rq7ySI3QIW1IbC9KkFYuWS0PMmK4pKyntYmYre
         6WWjAn0evkf24PLE4SaZxskX2R5YrCjYRSX1vzj4m4QHquAUbApuENsWm+nEJixzwbCK
         y9LevEcT/8fKvinYyogbhNKERKXQPk84fL2Oi5ZT3gphxWtUsS0/Mput7Nah+9gWLUQQ
         5auZNB+tZUU4+9hZaOwycR68RmDVyvr8K6qnByREjCnXQG8sVrHarJs/hhVbt5CXaUpX
         qleE9gLNYp/ATeLvc/QHyiDL2d0ATqg+Bu8RJVs7xMhu+SDD4296/EDgTkP3Ajj7z4YV
         Cirg==
X-Gm-Message-State: AOAM533xzTbIyrzhRB4keAk7kiR95O+T03kdku2STKbtAsG4ywiutNX1
	ezv+VW/V29VPNTkOfLJTjn3CE5xLexNgiuwn
X-Google-Smtp-Source: ABdhPJySjPbOjvy49qH/ixzYjB67kfW5tV4uWNR105mBZc/qSpH+S/W3V4/xVsZX2tuPQoCV8d5uSQ==
X-Received: by 2002:a05:6214:21cc:: with SMTP id d12mr34620467qvh.22.1630503847368;
        Wed, 01 Sep 2021 06:44:07 -0700 (PDT)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-32-216-209-220-181.dsl.bell.ca. [216.209.220.181])
        by smtp.gmail.com with ESMTPSA id i18sm937qke.103.2021.09.01.06.44.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Sep 2021 06:44:06 -0700 (PDT)
Date: Wed, 1 Sep 2021 09:44:04 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: djwong@djwong.org
Cc: users@linux.kernel.org, tools@linux.kernel.org
Subject: Re: lore.kernel.org upgrade: Sep 1, 2021
Message-ID: <20210901134404.hy5cxwiw43xvj2mi@meerkat.local>
References: <20210830164626.tq5emfrht4o46x33@nitro.local>
 <20210901012310.GL4159675@sweaglesw.org>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210901012310.GL4159675@sweaglesw.org>

On Tue, Aug 31, 2021 at 06:23:10PM -0700, Darrick J. Wong wrote:
> On Mon, Aug 30, 2021 at 12:46:26PM -0400, Konstantin Ryabitsev wrote:
> > Hi, all:
> > 
> > My tests of the new lore.kernel.org service (currently running on
> > x-lore.kernel.org) are looking good, so I will be putting that into production
> > on Wednesday, September 1, 2021.
> 
> Any chance I could persuade you to remove the color changes in the CSS
> stylesheet?  The text colors on the new x-lore appear washed out to me
> due to "color: #333;", which makes it harder to read.

Folks, I am just using upstream CSS choices. We cannot both provide diff
colours and not offer some kind of base foreground/background colour defaults,
because this is how we'll end up with dark blue on black.

There are multiple ways to tweak how the site looks -- both via a custom css
stylesheet (see the "color" link) and the "reader view" in Firefox, which is
my preferred go-to.

-K
