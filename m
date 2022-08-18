Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C2254A10
	for <tools@linux.kernel.org>; Thu, 18 Aug 2022 21:04:45 +0000 (UTC)
Received: by mail-qk1-f172.google.com with SMTP id i7so2054039qka.13
        for <tools@linux.kernel.org>; Thu, 18 Aug 2022 14:04:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc;
        bh=eQphRVhQiO9nhpWISMRIpmNXY0SYGUpeQuSyCYuSCVI=;
        b=CpJ0iB5iYzi6oE7bfZ8aUIbTtVRK2s3CP2ZH2hj5Y0agPGDShwPlN5KRadzkRNmzD5
         BYSAmiSP+P6ndeTnHd30Vzmy89mS0dVr5DSfUIyf2akwJ+SW4AMX03gJRf+vLe4jW6MQ
         HLJVPliOwX613ephaCHb9jbEor8Zsko9aH3vM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=eQphRVhQiO9nhpWISMRIpmNXY0SYGUpeQuSyCYuSCVI=;
        b=Grp/cmXbpwIAOy2X8C40PPs2x/RsRXVHFlTPleMhqJLWA4WIX2t2B2fShP2u/T8vjI
         nVx1xa6T2T/PvNxJIwIKBktMokzG66iGhlhRf7YemlHoLsydpdzNSiNGgfssU3Hz+LFw
         MLTGfYxksOUOkb1OHbPbKMHXIYEw66tM56g3nDEOBsD85Ag5gJeA31Q2nV06EDrKa2FN
         WSSdF8F1H/ljH9WQELFeSZMh+6ZAZw/uLR9FIClpKkswVVswsTlbL6RY+qZHg3lfWULe
         y8K+wFA1t7tpb24PVIEgWgCxanRRjGtWv8A9Ftw5/QANZW6jhuedI/0UpEsu4f3nSb3H
         KhTg==
X-Gm-Message-State: ACgBeo1xrAhzlUDGOgkaaJONa83lJVDThUWS/cNh5QnpD7IafpH8zx4o
	Qsogry8dpvNslLhMhbuAmCmVPg==
X-Google-Smtp-Source: AA6agR5sW/CRStaX+sDZ1E7k+Few5ssVASloxvheH3RstKAc+x7HScVfzA3TAr0G/4xVxfPWX390Bg==
X-Received: by 2002:a05:620a:21c1:b0:6bb:7ccf:6833 with SMTP id h1-20020a05620a21c100b006bb7ccf6833mr3475190qka.541.1660856684179;
        Thu, 18 Aug 2022 14:04:44 -0700 (PDT)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-30-209-226-106-245.dsl.bell.ca. [209.226.106.245])
        by smtp.gmail.com with ESMTPSA id y13-20020ac8128d000000b0031ed3d79556sm1644139qti.53.2022.08.18.14.04.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Aug 2022 14:04:43 -0700 (PDT)
Date: Thu, 18 Aug 2022 17:04:42 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Conor Dooley <mail@conchuod.ie>
Cc: users@linux.kernel.org, tools@linux.kernel.org
Subject: Re: b4 submit ready for beta testing
Message-ID: <20220818210442.spgrtaktztqrxded@meerkat.local>
References: <20220716142954.voq4ucnl5wkq7h2b@nitro.local>
 <20220720184835.uhnkucai54alhgo6@nitro.local>
 <87pmhs1d8h.fsf@baylibre.com>
 <20220726142743.dllhmbivtb2yk4uk@meerkat.local>
 <87bktbapri.fsf@baylibre.com>
 <20220726205653.yjmafga3utcwjef7@meerkat.local>
 <e2ca58f1-3c10-0dc6-ebdb-3ca088b430d7@conchuod.ie>
 <e2198b0d-9688-099d-75cb-99a5bf12191a@conchuod.ie>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <e2198b0d-9688-099d-75cb-99a5bf12191a@conchuod.ie>

On Thu, Aug 18, 2022 at 09:12:54PM +0100, Conor Dooley wrote:
> > Apologies if I am missing something that (should) be obvious here.
> > I am trying to use "b4 trailers" to update a local branch that was
> > not created using b4. I ran:

Thank you for testing it out -- I've only lightly tested this code in the
context of not using a fully-managed branch, so you're probably hitting some
very nice bugs.

> > b4 trailers -u --trailers-from 20220817201212.990712-1-mail@conchuod.ie
> > 
> > It took 5 minutes before I got any output from b4, so I actually
> > began writing this email in the meantime as a bug report...
> > It eventually worked, outputting:
> > Calculating patch-ids from 16806 commits

Ew, this is going horribly wrong already! It's only supposed to find recent
commits where you're the committer (git log --committer=your@email),  so I'm
wondering how it's matching 16806 commits in the first place, unless you've
done some really crazy rebases.

I'll take a look at it first thing tomorrow.

-K
