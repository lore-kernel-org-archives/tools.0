Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0586F2C80
	for <tools@linux.kernel.org>; Thu,  7 Oct 2021 18:22:59 +0000 (UTC)
Received: by mail-qt1-f171.google.com with SMTP id z24so2365505qtv.9
        for <tools@linux.kernel.org>; Thu, 07 Oct 2021 11:22:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=OkYr4oXntBezwLoh9gXoeJaZZouQOsvPJwvRn62xa9c=;
        b=XGftD0svCqTUCEl5hGeUmAHiYV0DkWzHie687EnuZHfcjXGdmnVm0+xYksDcW1Lf4G
         ZAezN/b9+/lftjqu1YonZ7N0iaPlhNPXjlgPLnotuwT3+OEcJsVtCY+WVEdlFAyNSKe1
         mlCCb1Y+9JAaaLg4GU51ixPNsM+f4++SrpH6I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=OkYr4oXntBezwLoh9gXoeJaZZouQOsvPJwvRn62xa9c=;
        b=DLGNZ50ki7FdhMiPLlPJs8eFuYdQepewTUWaAvCRjHIpsQOPx+KoppTLp7Fmd6APv2
         SCEM1vrG1sNVLpubDdHBldiJ7GAfNe0ssp+dpQBpXvZxnc81tDc5okLa/m/TkevSXy+0
         ckhHEuBcALU6h5UWXcK5LvXisGtSdd/gK/PLPKhAT8b7o3Zdu6uKj0+8LKweNNctyfDx
         ZM1T78yIzwQaAwYf16v2bOD0F9LMF1bbACWF3DdWmuFIYhQxipRv9+ga0dCo5PtV2mpL
         1Rw1zLSai/0stkrY1yzt49gg20rp3a7f6ovEsbACTvsTBd8RRPi616L7N3h5hbU3qFpq
         lRFQ==
X-Gm-Message-State: AOAM533F3w0dHqfVwWUK5WIqzRAIiNZ7CfuCw6QwkpDJ6nt1TIdfImkB
	0q+y7tQJyVifBOQyw82oTGDnhV/DYE5T5w==
X-Google-Smtp-Source: ABdhPJxI+2gMX9jyrLuJk1SvLLVLm2/qnubqFMj3SfcMNic5PXXctmzNsDUeSwelWYZ4uDsJvsw8zw==
X-Received: by 2002:ac8:5ad0:: with SMTP id d16mr6858238qtd.42.1633630978974;
        Thu, 07 Oct 2021 11:22:58 -0700 (PDT)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-32-216-209-220-181.dsl.bell.ca. [216.209.220.181])
        by smtp.gmail.com with ESMTPSA id v3sm107974qkf.131.2021.10.07.11.22.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Oct 2021 11:22:58 -0700 (PDT)
Date: Thu, 7 Oct 2021 14:22:57 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: tools@linux.kernel.org
Subject: Re: b4 and git am -s errors (was Re: [PATCH 1/2] ext4: docs: switch
 away from list-table)
Message-ID: <20211007182257.tj6vrjgfusizv3ml@meerkat.local>
References: <20210902220854.198850-1-corbet@lwn.net>
 <20210902220854.198850-2-corbet@lwn.net>
 <20210916095455.GE10610@quack2.suse.cz>
 <877df9tt5d.fsf@meer.lwn.net>
 <YV8EGFcPtM9u+ihl@mit.edu>
 <87wnmozy9i.fsf@meer.lwn.net>
 <20211007173854.v6wy6cpekbv3lf2i@meerkat.local>
 <87o880zp4n.fsf@meer.lwn.net>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <87o880zp4n.fsf@meer.lwn.net>

On Thu, Oct 07, 2021 at 12:06:00PM -0600, Jonathan Corbet wrote:
> My script is still "b4 am | git am", haven't tried shazam yet - it's
> definitely on the radar, though.

Okay, now I'm curious which version of git this is, since I can't seem to
replicate this problem -- I just get:

- multiple identical Signed-off-by lines if my S-o-b is not the last
- nothing added to trailers if my S-o-b is already the last trailer

-K
