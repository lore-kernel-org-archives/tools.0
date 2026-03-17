Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0C6E3F7AA2
	for <tools@linux.kernel.org>; Tue, 17 Mar 2026 18:58:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773773887; cv=pass; b=OP07ldm+vsM/Cb4ACWbCZZVGHPjRZo4OfZFbVt3UbEGv4EgP7wWwoLrz01XQQ+DZpWoNsQ4G1txte9fUfo8iBjCEWbx1GxSXnDJxmdk36DImuQ60Lom0+yzFv6pKZspcZO/1Pr2tC+F0ZwaOpBsAoero0sFixv1/dwqnS39MygA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773773887; c=relaxed/simple;
	bh=DpLYn/wCQc2tUCmqUX4txQVyqObN+mQP//oK8owcLyA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dCXBN+ijr41eKAxWpObu3pHRPeCVpGy0CvGy6Q6PcZ7+LivisRT/Q85uwp+A6r0MI4H4R3+9WwND1C9iJ86hvP473inRYyKXIwipJNdLxmVV7BUjXpM00grZWiwosumeiA0oJ5hVCtLbr32+MaQMlbGfvGePGKU7LyFAj2VWSiA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=asXMa1ML; arc=pass smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="asXMa1ML"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2b04d051664so28206335ad.0
        for <tools@linux.kernel.org>; Tue, 17 Mar 2026 11:58:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773773885; cv=none;
        d=google.com; s=arc-20240605;
        b=Px0khNqeorDQUiDlIlie0cM8EVp+TX5eRwmAEsQxkmOx2GoimXbtXmHWQGUga17BlF
         CMkxwST2OkewejOwYBpdYVQ3pZIuoy/TvcNOPFgozlUyV0mTR444DA94610okQRalW3D
         hNWeh3pRYZOKku95JiJb/xeA2UIYGH1J+NWG8G7sOLDXJyW+o+8uwk4mpWImAQ6/2PSc
         uPy4iM5yxLRuyR/TldsKMRg8M5TzyR1KAY6QtQz62k/bbLQqg8r9+Vm3mznIjkOQCAlf
         wBH3ldH6CkAoZ6QUI6YWzwmNDoW3cctQgx1uxF0UOJh1OEqFtA3byeu+JiO7iQ6FtPvd
         P/jQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hMVld3CG86qcxE/IAC5+u+C2IQn3cQYX/jIFF+64Vng=;
        fh=+cgzxB1yZvGz/zVISmlLTGOSPtIcRsYKLnedcACnj38=;
        b=ifi301TDNdYHIpDCoPJSTQeMl9RvX3BM9ZYAKTHqlvvXdwqa6C4f7H4fCE+f4KMqxZ
         TpsM0urwzCnh54j3hHfAAm+bpj/+CRewsg8y22wKPkWMtfK+AfJtfUIu7IPmMGxOG62Q
         W8c5XsZ4R8z4K3DEfj+QM2NtvjCcF/WnAp/q9Ms0p9sFwT8daM6y8kw9jbvHsYv0GRhC
         l645lLbiFslsBeZjxCEsm8I5Mxwz9T9FUb2MzSwRzqrlFurEeUfi2uvG92hUE+fDqYi9
         rRJz9/rQDkKRbafFQLbjmOWlW56L6sr4xZyu99x6Q19OzZmuD3oopuORx4wvziG8E6IY
         Gwmw==;
        darn=linux.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1773773885; x=1774378685; darn=linux.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hMVld3CG86qcxE/IAC5+u+C2IQn3cQYX/jIFF+64Vng=;
        b=asXMa1ML5fhXuvSpWR8vDOknUJvl8cdU2toxqxgDHL6w54soQIWmJXo0EZLSGqzu5J
         bzFfBAJ+hXvHw4R4m19jjlBxA/xbI4Rv/KfkTg5Nix68ja4jM1Cg9jTg6GaiwEWrN0L2
         7o6EFPG42UiyBdQRauG/GpMHWLEVzwjziAyjdoycF0C3tC4kBLb5w/UBq2eFR/02BiHY
         eEg/W2FqqoUXknhq+DG/Dlla2/3tacxATKOrhMZvKkd0Ja27yEGyN/RSibHriv8K/vrp
         MvCWopWJn+wxkrW6j2zET1ospJVPV3W7XoYh7xDe04PAIiwNQi2CwrpHvvcSykEN/i8/
         U2Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773773885; x=1774378685;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hMVld3CG86qcxE/IAC5+u+C2IQn3cQYX/jIFF+64Vng=;
        b=jkmv1TvgZw+es6B8fppNR1tVInyNmorHbhwG2kJUv78veTdVU4uvOIdOq2cbPpjKmc
         WV0wqT3aITdVQwTf/+SLFkF/Fb5EsxAuRCzWd9UYZe1dSfw82Xlny5qszrLe/B6pTxCQ
         eL3RUhGK2S3rLlrgf+8PkRnlS0Kq4b8Y898I/H2ACmUwKRkrhrnvl2ewdemp0W1yfmnF
         m/9vdq5PJUyYo/Fb100R74vIb7Y7+jeQ1NiAqhqP2MBj06nncPhxN+2Sx7Yod3kgC4cX
         azt0bRgnMneqoMuhDgKfRi/daDLELJ2ecmQzqmQC8imBX3ZIY8dk00xF+Y0yPZZF/maB
         BgtQ==
X-Forwarded-Encrypted: i=1; AJvYcCUx/1d04+d0I7WZphPu4UfXuUkstQhqJ+z1wjydIzwNuajckMud030U/gIjISVFfNoj5kzWqA==@linux.kernel.org
X-Gm-Message-State: AOJu0YzrxUrDrH4AGO95lBRDQhDP082F0LbBcedW7/5Z0LWo/iOvkHQY
	S8uQDq/ZoRm4GiqnYHjSF1Q7XCNmkzdlYA/mrXV4/5o9dv9tuOtInFcJ6FeMnFZ7feAhZTAcaCd
	rESAam/ln2OcmFKH2jW+w1zV+QQ+I1ukO27G4Dr+m
X-Gm-Gg: ATEYQzw5AsBZfnyuxMIZMKvC8ECt9pJtF1GSH1VaYD/5lnjMKPXZ1nbI7YVOLdTGrzX
	qkDkz5VcrS3pLGd+dijY9qMu2d+D8m5V99uA9MwcGAcufw0D7VMdlG99Sy2h6O3Shj9e33x6Ivq
	YwUUmJYR98/Q9UqrjGGQWahiKxuscnT1uAOJH1JD9v8kiAtZ9mln3pIqOLsgAuOdDpTlPYL9rg1
	ACck7OSyyQTaG4IRJ2CaDlmEn89RDvPZBLjzpG0HFJnOnaNTeLA3Mz5LfcsGJGFjpVrygGv4RID
	rCTGEjN5en03szP4Jw==
X-Received: by 2002:a17:903:2c06:b0:2b0:5fbe:12ff with SMTP id
 d9443c01a7336-2b06e3d3502mr5901725ad.30.1773773885069; Tue, 17 Mar 2026
 11:58:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
References: <CAFMMQGt-Dc4DiSNUYR1mQfUBswP9bmjyXfcvuy6HO57rZ79fHA@mail.gmail.com>
 <CAHC9VhS7nBWxZ0=1c_ec=Lq+J0CqZUGbriu2i==X7FciSw0K2g@mail.gmail.com> <CAFMMQGvQU8FnuKduaSEpxAPuP=H52n-6HZ0uiM=WSWtEc_w63w@mail.gmail.com>
In-Reply-To: <CAFMMQGvQU8FnuKduaSEpxAPuP=H52n-6HZ0uiM=WSWtEc_w63w@mail.gmail.com>
From: Paul Moore <paul@paul-moore.com>
Date: Tue, 17 Mar 2026 14:57:53 -0400
X-Gm-Features: AaiRm50SRc_UOO4nqX-YuWq_9LlVuhWGaCXRsSF87KjtKO-zgqPY80xwDGt7BJs
Message-ID: <CAHC9VhSdZB1e2p+7Yrdd5=gmAO34393gic5YuHFvg13ghQu7Pw@mail.gmail.com>
Subject: Re: Using "b4 prep" with Stacked Git
To: Chuck Lever <chucklever@gmail.com>
Cc: Konstantin Ryabitsev <mricon@kernel.org>, users@linux.kernel.org, tools@linux.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 17, 2026 at 11:48=E2=80=AFAM Chuck Lever <chucklever@gmail.com>=
 wrote:
> On Tue, Mar 17, 2026 at 11:27=E2=80=AFAM Paul Moore <paul@paul-moore.com>=
 wrote:
> > On Tue, Mar 17, 2026 at 11:08=E2=80=AFAM Chuck Lever <chucklever@gmail.=
com> wrote:
> > >
> > > Hi Konstantin -
> > >
> > > I'm a long-time Stacked Git and b4 user and I'm hunting for a tool to
> > > juggle the many data items involved with posting kernel patch series
> > > for review. "b4 prep" seems to fit that bill but it has some issues
> > > when it comes to large cover letters with Stacked Git.
> > >
> > > The branch-description strategy is the least-bad option for StGit
> > > right now, but it's fighting git's design -- git config was never
> > > meant to hold multi-paragraph prose, and there's no way to tell StGit
> > > "don't print the branch description in stg branch --list."
> > >
> > > A file-based strategy would solve all three problems cleanly. Somethi=
ng like:
> > >
> > > .git/b4-cover/<branchname>/subject
> > > .git/b4-cover/<branchname>/body
> > > .git/b4-cover/<branchname>/changelog
> > > .git/b4-cover/<branchname>/recipients
> >
> > Fellow stacked git fan here.
> >
> > I do something very similar with my own scripts/tools, and if I could
> > offer a suggestion based on my experience, you might want to consider
> > some slight naming tweaks to support multiple cover letters in a
> > single branch.  It's common for me to use a single branch for multiple
> > revisions of a patchset and being able to refer to previous cover
> > letters without having to go to my email or lore is very handy.
>
> I also sometimes use multiple cover letters per branch, but I just
> considered that a bad personal habit ;-)

Heh, I guess "bad personal habit" could describe most of my workflow ;)

> > This becomes easier if you include the To/CC, subject, body, and
> > diffstat all in one file.  My cover letter tool formats and keeps the
> > cover letter in a format that can be quickly copy-n-paste'd into my
> > editor during 'stg email send --compose'.
>
> I've been doing that by hand until now, in a single file. But that
> requires tracking series version, In-reply-to, and other things that
> "b4 prep" brings to the table automatically.
>
> Sounds like one vote for "single unstructured file rather than
> separate files". Would you send me your tool privately?

Be careful what you wish for ... ;)

There isn't anything private or scanadlous in there, and on the off
chance that might serve as a use case example, or perhaps a warning to
others, I just tossed the script up in a GH repo:

https://github.com/pcmoore/pstg

The cover letter script is the 'pstg-cl', and you should probably be
able to get the basic idea of the tool without having to read the
other scripts.

https://github.com/pcmoore/pstg/blob/main/pstg-cl

> > > I'm asking before prototyping to see if you've already considered thi=
s
> > > idea, might have another idea, or might have something already in the
> > > works.
> >
> > I've built up a collection of shell scripts/tools built on top of
> > stacked git over the years to match my preferred workflow, but I
> > wouldn't consider them very pretty or something I would want to
> > support.  However, I'm happy to share the basics ideas/concepts that
> > I've found helpful :)
>
> A bit off topic: I've been building a Claude skill for using Stacked
> Git that encapsulates some of my habits and prevents Claude from
> having to rediscover how to translate its git commands to Stacked Git
> commands. It's here:
>
>    https://github.com/chucklever/cel-kdev/blob/master/plugin/cel-kdev/ski=
lls/stg/SKILL.md
>
> I'd very much like to learn how others are using "stg" to incorporate
> those ideas into the skill.

If you're really curious, the 'pstg-pwork' tool is essentially my
reviewer/maintainer workflow in script form.  It's ugly, but it works
for me :)

I do plan to add some LLM patch review options to my scripts, but I've
been a bit behind on things and haven't found the time yet.

--=20
paul-moore.com
