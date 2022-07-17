Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C52D27A
	for <tools@linux.kernel.org>; Sun, 17 Jul 2022 15:40:59 +0000 (UTC)
Received: by mail-qk1-f172.google.com with SMTP id o21so7122701qkm.10
        for <tools@linux.kernel.org>; Sun, 17 Jul 2022 08:40:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=g2q6u5bPjsgvHXfjntd5661m3pjITzjfWFdilAC2kZ0=;
        b=Av1DqgQzUi1tmo2dv2bcNy+Z2KvWRbQb+GakWK6Hgd+gzVLX5J7seJ079QJGCSp0A9
         Zc2nFtCfIYE9vln8cWRY/aYLJrGQ+kEOWz6dCwFv8O742Hta+QAQ1SCOkTtO3SrLjMws
         8BmA9Nj317gUFRn6a18pg2KM5jtFi4CoZliqM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=g2q6u5bPjsgvHXfjntd5661m3pjITzjfWFdilAC2kZ0=;
        b=Hp5mBpS8ffvABZBPXHDH8lQuM/wSHNpdKDWXZGdvQBLbYmEJ8vFwteIgCUIvNv3DHr
         /FOto6A6tYb/e1CHdoWcbJOx+pn204R0tzSYskqWAHfKA87PWOZ4wQfEPt99HtzhELr3
         m4DK0jLcj3UqEOKmeEVyNds06pbqeEnsZbaeFymWGVu0QuLKSTKODZXbTSzayuE9GcTY
         aUef5dwaAGXuaAYthBnMErxnUNdZXjdKub/TMlXsATq2wuW3GenMRLpOGtBi796LFDPz
         EXYGsfG28t7+5uP4cDDPEY+rPJ0QFxMkIbIvQPX+eKuohZExnHGj+pr8BZRb4esa4iA2
         6Eww==
X-Gm-Message-State: AJIora8uySZ+RKkzba7wTbWwq8b1GnQXfv459NeEv+w8d43jtewtbaIQ
	Fac6CpQ+pOF3Uy+o6sWD02aU4A==
X-Google-Smtp-Source: AGRyM1s4kpEVgAu5ufm414avcIaeYW9HYsOVDo9SIjHweob79qHk2qTIvc78ujj5r6/awysmRm+Lzw==
X-Received: by 2002:a05:620a:190c:b0:6b5:9f6b:77d9 with SMTP id bj12-20020a05620a190c00b006b59f6b77d9mr15426010qkb.142.1658072458662;
        Sun, 17 Jul 2022 08:40:58 -0700 (PDT)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-30-209-226-106-245.dsl.bell.ca. [209.226.106.245])
        by smtp.gmail.com with ESMTPSA id bj27-20020a05620a191b00b006a79479657fsm9007082qkb.108.2022.07.17.08.40.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Jul 2022 08:40:58 -0700 (PDT)
Date: Sun, 17 Jul 2022 11:40:56 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: James Bottomley <James.Bottomley@hansenpartnership.com>,
	users@linux.kernel.org, tools@linux.kernel.org
Subject: Re: b4 submit ready for beta testing
Message-ID: <20220717154056.ebbf7x3g56cdto5q@meerkat.local>
References: <20220716142954.voq4ucnl5wkq7h2b@nitro.local>
 <4c4652b0e333bd81b91f71346ac6142322682eff.camel@HansenPartnership.com>
 <20220716145638.ubuwwc7xtjw6ugy7@meerkat.local>
 <CAMuHMdU8H98M2u9OXM347+Gz8Y9erwTejv-3U_=8KTK1XgMdow@mail.gmail.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAMuHMdU8H98M2u9OXM347+Gz8Y9erwTejv-3U_=8KTK1XgMdow@mail.gmail.com>

On Sun, Jul 17, 2022 at 11:58:08AM +0200, Geert Uytterhoeven wrote:
> Empty commits are very likely to be lost on a rebase, as the default is
> to drop them while doing an interactive rebase (unless --keep-empty).

Geert:

I think this is no longer the case with the later git versions that use the
merge backend for rebase. I just tested "rebase -i" and the cover letter
commit was successfully kept without any extra flags being required.

-K
