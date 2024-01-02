Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03F0912E60;
	Tue,  2 Jan 2024 15:01:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Jyrz/HpM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D4E0C433C7;
	Tue,  2 Jan 2024 15:01:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1704207678;
	bh=0w5hQqq1M0ZyiimIFHmRv3iOhnDxN5ozTS/K2lYu2tI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Jyrz/HpM4o6AS49Eui+5eCvyXdesnHTBc7fxLxpPG6eA3MbJKiTrWeCZGgxcX3hfG
	 sl6HgRZ5o0XR0rZGf1x6T1OAlRLzj7Rql1+zg1ivLVzDmbhy7w1oEG/R6EfLh18/QW
	 K5wfHuFnQvEl53TXa3/aD6CxSVf8k/WD9FPq5duE=
Date: Tue, 2 Jan 2024 10:01:17 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: users <users@linux.kernel.org>, tools@linux.kernel.org
Subject: Re: Re: b4 modifying Cc-tags
Message-ID: <20240102-axiomatic-gabby-whale-48d3bb@lemur>
References: <CAMuHMdVGqTM08DvsAjZ45wn1HTR0Grh8Ewj9q21pPwJmbok5hw@mail.gmail.com>
 <CAMuHMdVhyjjcyxMAGF8rAqmyqin=xjWH0fhhOjqbq7rH4f-RNw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMuHMdVhyjjcyxMAGF8rAqmyqin=xjWH0fhhOjqbq7rH4f-RNw@mail.gmail.com>

On Tue, Jan 02, 2024 at 09:07:25AM +0100, Geert Uytterhoeven wrote:
> Hi Konstantin,
> 
> On Tue, Jan 2, 2024 at 9:02 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > Happy New Year!
> >
> > "b4 am" converts
> >
> >     Cc: linux-m68k@lists.linux-m68k.org
> >
> > in the patch body to
> >
> >     Cc:  <linux-m68k@lists.linux-m68k.org>
> >
> > causing a warning from scripts/checkpatch.pl:
> >
> >     WARNING: Use a single space after Cc:
> >
> > Reproducer:
> >
> >     b4 am 2023121940-enlarged-editor-c9a8@gregkh
> >     cat *mbx | formail -s scripts/checkpatch.pl

Thank you for the report -- fixed in master and backported to stable-0.12.y.

> One more legitimate message caught by the overzealous
> 
>     550 5.7.1 Your message looked spammy to us. Please check
> https://subspace.kernel.org/etiquette.html and resend.
> 
> Thanks for fixing!

The main problem is that your From: is @linux-m68k.org, but you send from
Gmail. I'm afraid there isn't much I can do to tweak things on our end -- even
if we make exceptions for your address on our end, your emails will still
likely be rejected or sent to spam when we try to deliver them.

This really should be fixed on the linux-m68k.org side of things.

-K
