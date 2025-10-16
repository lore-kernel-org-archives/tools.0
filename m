Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BB323054C4
	for <tools@linux.kernel.org>; Thu, 16 Oct 2025 15:08:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760627294; cv=none; b=ohr9t/SiMYxJv1HXrSRhwTZ2yUYlBZ/858MU6zJ/K1OhfSs9fbrK9NGwdQ+vu/bVVB1v2gyWQLZpTXwN0h4nG9ylrqebK1Oj2qZEW3GrGPRNC1Om7cUgYzRDEXKVaOB4EWcmmconKJGuYDGXDi0Jqjrqa19KOqXU/O0c1LPW3ys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760627294; c=relaxed/simple;
	bh=0cPKNjlLps/HOp/pNQwa9jOkbnMYtta2arv+bbFaykE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lEOay3kvo0vWhhUs+X8VEqjNOvIU3g1CnGZaxCCO6PuANYFmD6IXg/x8AzyuECy8tIcC1NhydAUmbF6q+qWnJ9iit8z99F4LUPanMowNoDWeU4N8iPo6QAe1KUL4IThiSZ68/+3CMhoSP6ThIoy/yBidmmKZ73QSsIRVK+azvd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=H8njXtUc; arc=none smtp.client-ip=209.85.160.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="H8njXtUc"
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-3c8f257b7e1so1269067fac.1
        for <tools@linux.kernel.org>; Thu, 16 Oct 2025 08:08:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1760627291; x=1761232091; darn=linux.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VO+4NAMNLm3+ETnXnMHmbHusbEkgXiBzT3Hnja9ypMg=;
        b=H8njXtUcNB6XMHe7EhoYZ+vFoj4VjEmJzdfwQ3MVetfapMsSUX6W6ew3agYLcPsHq/
         u5uGj4Jk10jZXhGxLzuoletsxHY0CRcarLFsna4wFGj04PsuTVxabKBfnjmo2Vz9Rr9o
         5RPFbQFrIqLKtKebcKU4wjk9+k3AHVnj9dsiYcABKX00pwFUvpDzpF0M0rrDp2qplSr0
         NX+arxOWn6dxmFSWud+OBLdBZXCTW5hxYK5JJ6A9PPCGehKJfMbOfrjGe99w296DdBU6
         jGexO6xrUvyitUL2A2aoINBfS5fexzbMFQUR2G0AAEl32PRe/VjZOhFGYKRSn3wE4Llu
         Kp3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760627291; x=1761232091;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VO+4NAMNLm3+ETnXnMHmbHusbEkgXiBzT3Hnja9ypMg=;
        b=q7MdF9t9mvc1Fwjz1e7okHQPFIJggln0WBkbwoF5/ia5mx6t/xd/Xg/yPAu54TnQKa
         bU45GVZO1N8Vu+b7CnS+oR+v9MRGPyeMOrJrMy5HCTSWkNy9Jrn/jw23lGBDtHTCGzZ2
         o62icIrKRsMBAmkhMfMbPqsg19Z0lVIdCHHuTTsUwoIGzqlj0Sd61Q21OD3OWLgtl511
         RE5CCTByTcw2kxtTTB8X508Y5pJCbVX3IhCU4lwSSG8sD6jEZG5yKln7btFJmvNuf74v
         HUJaT/uDRXAWUhdbUOPKWiJUP56FjvIlclSkSF2MORFYIyUttPQkIuV+nd3yly52PTsf
         hKRA==
X-Forwarded-Encrypted: i=1; AJvYcCU/+Ghaus5P4c6puRbYSt9Mef37tTuFYPnu9W9/i4pWghGO7qndmXhay9QK+BI1WEoBn+1Tog==@linux.kernel.org
X-Gm-Message-State: AOJu0YxL+B1KoJcGfy1U4nWHzdZPmbKrCkHeQFpGQKCDsl9q+sEo4R8Y
	z+VOadenUuKAjXvZyPWM4qVsvTTqzUTY3o2oYr35zpMM1PmOhGgEH3Lqkn0BOoddotvA77Nperq
	58QsA
X-Gm-Gg: ASbGncvy8CVBZhXq1StNraZsfc+K0z3+6ny//OmCjfISXl/0M0K9TXgZatWkVVGmFQf
	wHRP/codyH/jFS2dmS+DmNS4xfL1975h/WbLr68vVLGLcECIHvU3Y+HXTHJQ/LGWo3pKp8BhFAj
	ETledO9W23QKSKk8/twaCTnazFqXbCRJHhx5E1LHQcFJIEMVl0/runE+TRBNCqdUJvecA8mxpFd
	t6CI39BDQQ4K9Tf3dYyYPl9kAiXbSWh6qBa0iFlfo0mwccPRE8RNquGFBxUCZnvMu8tgrsYIlnr
	266Cbn7+1HoXOzEhlwg/DWndMxskP1pPGQ+g7SWPoMVO1cwz4RbFNTuFoxgnzRNBpFU+O120bHi
	YK7SGHmvSJ/1FutilxZFZkif/5s8E30LOfAJAuC11Iat7xgGFYw==
X-Google-Smtp-Source: AGHT+IGZv/o1cy/lqJ7jFPh/n/eaq+lQBB/XZ/gC/7/6dbxrG3+jZTIhzG0ps7XvjjvD2W3pQ493Qg==
X-Received: by 2002:a05:6870:7193:b0:30b:7b4e:36e8 with SMTP id 586e51a60fabf-3c968b2d9d2mr2038357fac.14.1760627291302;
        Thu, 16 Oct 2025 08:08:11 -0700 (PDT)
Received: from ziepe.ca ([130.41.10.202])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-3c8c8adcdfesm6439496fac.1.2025.10.16.08.08.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Oct 2025 08:08:10 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1v9PaK-00000000UHr-4Boj;
	Thu, 16 Oct 2025 12:08:09 -0300
Date: Thu, 16 Oct 2025 12:08:08 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Willy Tarreau <w@1wt.eu>, Linus Torvalds <torvalds@linuxfoundation.org>,
	Junio C Hamano <junio@pobox.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
	users@kernel.org, tools@linux.kernel.org
Subject: Re: In defense of Link (was Re: [b4] initial "b4 dig" to supplant
 Link: trailers)
Message-ID: <20251016150808.GL3938986@ziepe.ca>
References: <CABgObfY5agTRsB-bCqCYbA0erFn5cVbujtTNBiCti8g_68nCWg@mail.gmail.com>
 <20251013081536-mutt-send-email-mst@kernel.org>
 <CAHk-=whSShtPG1_+02Cc4yDuEJxVqX=G8tAx0gW7UjA7cuBp-w@mail.gmail.com>
 <CABgObfZS--70UTOpSXo=JOZViN1jm4O6M92pu-6Qunif3v1Y8A@mail.gmail.com>
 <CAHk-=wg4WfbXs-kMOAM7FmQ0w8q3KO9DC8CWLg1WPnoaZW-Wiw@mail.gmail.com>
 <xmqqy0pezhm7.fsf@gitster.g>
 <CAHk-=wh--VXgwQ3s8DLeag6cegsD9cPcvkmbVft0Gesy2aGPsA@mail.gmail.com>
 <20251014033900.GA3126@1wt.eu>
 <CAMuHMdW8R0Smx_CKGL3b0tLiyEB63z5uxvXG2ZG5_sRy13+UQQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdW8R0Smx_CKGL3b0tLiyEB63z5uxvXG2ZG5_sRy13+UQQ@mail.gmail.com>

On Thu, Oct 16, 2025 at 04:52:31PM +0200, Geert Uytterhoeven wrote:

> As the audience may not know: you can keep empty commits while rebasing
> using --keep-empty.  But it is indeed tedious.  So I wrote a script
> called git-add-separator, which creates an empty file .separators/L<N>
> (N increasing automatically) and commits it, thus creating a non-empty
> commit that doesn't interfere much with the rest of my tree.

I use empty separator commits all the time, and git rebase -i
alot. Never had a problem, never needed --keep-empty..

Don't see any 'empty' related config in my 'git config -l'

It seems like rebase doesn't remove commits that started out empty, it
removes commits that become empty

?

Jason
