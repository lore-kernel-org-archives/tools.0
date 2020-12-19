Received: from bedivere.hansenpartnership.com (bedivere.hansenpartnership.com [96.44.175.130])
 by mx.groups.io with SMTP id smtpd.web09.13347.1608403768876972128
 for <tools@linux.kernel.org>;
 Sat, 19 Dec 2020 10:49:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@hansenpartnership.com header.s=20151216 header.b=nqdszNov;
 spf=pass (domain: hansenpartnership.com, ip: 96.44.175.130, mailfrom: james.bottomley@hansenpartnership.com)
Received: from localhost (localhost [127.0.0.1])
	by bedivere.hansenpartnership.com (Postfix) with ESMTP id 652B1128031D;
	Sat, 19 Dec 2020 10:49:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1608403768;
	bh=fXYyrGOHdwT+PZx7PKZf1U55XRoG/ZMZ1zvWPR9xAfU=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
	b=nqdszNovACcNriZJoqkX4nH3ekkYd8AIJiIKK7VHuDJVw4mgfBigfCPsHDejMwRBX
	 olvVYUW8mvTlJwpEPbWb7wFyq3b2skBA8FAVH/9/IMPHhYqzxOO9szNSu9oyzZ9knT
	 718LVTCrSMuzqqOmS79DUK8y7bautLjaM7PBm8Jc=
Received: from bedivere.hansenpartnership.com ([127.0.0.1])
	by localhost (bedivere.hansenpartnership.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JU27yuRQvFPL; Sat, 19 Dec 2020 10:49:28 -0800 (PST)
Received: from jarvis.int.hansenpartnership.com (c-73-35-198-56.hsd1.wa.comcast.net [73.35.198.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by bedivere.hansenpartnership.com (Postfix) with ESMTPSA id DED9412802DD;
	Sat, 19 Dec 2020 10:49:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1608403768;
	bh=fXYyrGOHdwT+PZx7PKZf1U55XRoG/ZMZ1zvWPR9xAfU=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
	b=nqdszNovACcNriZJoqkX4nH3ekkYd8AIJiIKK7VHuDJVw4mgfBigfCPsHDejMwRBX
	 olvVYUW8mvTlJwpEPbWb7wFyq3b2skBA8FAVH/9/IMPHhYqzxOO9szNSu9oyzZ9knT
	 718LVTCrSMuzqqOmS79DUK8y7bautLjaM7PBm8Jc=
Message-ID: <b6094139488f2b725eb6ef632afa04f349980949.camel@HansenPartnership.com>
Subject: Re: [kernel.org users] b4: encouraging using the cover letter in merge commits?
From: "James Bottomley" <James.Bottomley@HansenPartnership.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: toke@toke.dk, Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 users@linux.kernel.org, tools@linux.kernel.org, Jens Axboe
 <axboe@kernel.dk>,  Arnaldo Carvalho de Melo <acme@kernel.org>
Date: Sat, 19 Dec 2020 10:49:21 -0800
In-Reply-To: <20201219114529.42058976@lwn.net>
References: <877dpeol5w.fsf@toke.dk>
	 <bdffc35910338117c6ed66f6dfac2dc13d6ed03a.camel@HansenPartnership.com>
	 <87y2hum0t0.fsf@toke.dk>
	 <fc05bad0b5517500e62b271b8896f142060b235e.camel@HansenPartnership.com>
	 <20201219114529.42058976@lwn.net>
User-Agent: Evolution 3.34.4 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2020-12-19 at 11:45 -0700, Jonathan Corbet wrote:
> On Sat, 19 Dec 2020 09:03:36 -0800
> "James Bottomley" <James.Bottomley@HansenPartnership.com> wrote:
> 
> > I've got to say that creating a spurious merge for the cover letter
> > looks even more tortuous than creating an empty commit.  What
> > advantages does this have over the existing link tag practice which
> > is the one that we now use instead of the empty commit?
> 
> I do that too when I have a significant series with information in
> the cover that seems like it should be preserved; it's easy enough to
> do.  like the merge commit because it clearly ties the cover letter
> with the series of patches it describes; an empty commit or link tag
> wouldn't do that.

I'm not that keen on justifying a discarded idea.  The empty commit was
an original idea for preserving the cover letter which got discarded,
actually way before the link tag.  It wouldn't preserve series
information.

However, the link tag does preserve the cover letter and all the series
information, why do you think it doesn't?

James


