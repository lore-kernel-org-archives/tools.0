Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 572D0221265
	for <tools@linux.kernel.org>; Tue, 17 Mar 2026 15:48:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773762509; cv=pass; b=lQZMCM3dpe+5cPbeDKx+tdXxQAj2upsXlKEa0pO9FRvmStwBLGF80DB8W54CuHICUmaOwtEhPGijS53FQcjNrrsxbnwslEw/4VL6+cwOlMrtq3b+zpuUL7CDmlV0Ixmv2AKRUuB6fbfSeuWPfI8SenKjq3n/dPtTbE9OOxIF0Ac=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773762509; c=relaxed/simple;
	bh=V4dUhEY4uYdVG70o5P0r2lrWaZyuIQbkZae1cvxPxiQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=msh62qifPXsQ1uzfmjX5bqdQlsSex+fY9fyQ52cHVFEaKxW7BXZ+JhsIj11rKJWIwx6DfS/jIqSutZf9iUzwTU8sQuT1hM433r3dh3YHrycv0xv3IQ0Is6mQtHh6q7O9Dz/uJRKZxImHKk3r+ncek77jrmYm62KzG61lUsqwn3o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UTGq7Pvr; arc=pass smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UTGq7Pvr"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-50919fc3a14so68210531cf.2
        for <tools@linux.kernel.org>; Tue, 17 Mar 2026 08:48:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773762507; cv=none;
        d=google.com; s=arc-20240605;
        b=EELGeDDwR7gN2np8lYQsYKd3SIiloUYJ8+IszDW6IQLCnq0Z1Kd1L8Fx16rowtvf8O
         0zz00Bb43zSh4dB6Q6GnGyid308Tjo+xoRefy+H/EzOz5bvW86XDVwer7jkYV22MujOa
         8LxfGvaKvLpVCKgz7/75jJBc5LxMiN4OI3Sb3Tp6q9xM2Uw4eVklVJ3l7KOKDxHyKe0C
         L2DqEryJ5s+xkRMHgKf/o14Nwd9YMg965nZMSO03qgoUD+ExIu9wjRYvHjFw0OKkf1k1
         E27Q0jtElO1Brta2xB84Nup6IZ3B+iNkuMcVhpmhPQ2TKBqNbAMH3vZFvyZijTLBMlcn
         gs+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FNf4xVpbqKtJxTiwSKKalguzkeBWcmuF4BtRnY7BkRs=;
        fh=JRha5WL34jEFj/oZGCvpljg2schN/3KTZ7ZiX24iziA=;
        b=gdLSGy5iaS002mpwWwVcMKGVdoNmOZCKSL9I4gn3LNJbTypqAhh4WPgeoA3yTvR4HF
         hT38e3cSjU2pz/4BdFxPOqwxVgTINl3MU7sVzLljkeqSKq9UHf3Vup1DCVtCyOdxIvF3
         Qy76ezjTo+PqF8DCrIBkXg0SRDhvnAcrqB9w+Z52l3iCq1vgY5+7Z3FQCOtp8e4iBwFp
         Nh7RUPcAxxZ0J7scXAesL9jnBFEL9RFG/ZKJhZQAJrifNiY91FCq+GEiSkZhSc4TrL3y
         5l4sv/2jYd+w8cW6MLJBGJfj/v3PigB1ViCo56IiIYG4rjHABvELbxVQmKk0BZRsPw7M
         4rgg==;
        darn=linux.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773762507; x=1774367307; darn=linux.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FNf4xVpbqKtJxTiwSKKalguzkeBWcmuF4BtRnY7BkRs=;
        b=UTGq7PvryvP+NA4bV+ZQ2ncRRHueYweM11jNuIrL1133fv/9ee47x1cCXYxYwMdutb
         0J6g8gys72yZqEf3bByWuT+XF2S+wmJGUzY2MclHQlSRVphyaAwunp3YxI3HavoHwxST
         oJFvvTl7sfqy5+YlCWM0G+JmsBv1r8NtnetL/Sj0+hEQOqMPwRBALeSQJcif9RRYaVDl
         yZc04tdeWaTAXjsE1gNiXnHMcFrL64uBUUTorTDgAIkvFFmM8rrktkLC3jOHCbzykzfm
         MVUcA65tVOn9XJqo98lSl4bDR4rmyRf8tSLJon2GiA+5SzSr0LWMCNauLF7ryHrRxOOh
         tzPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773762507; x=1774367307;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FNf4xVpbqKtJxTiwSKKalguzkeBWcmuF4BtRnY7BkRs=;
        b=ZCp6EDoVgN9wRlU1XwD4bCK7Y/RMXvRoA6KyA4+r3C8KVFOnELaglh5KBtD2s7QvI5
         h52uDqubFzm7iwEf4WLxuUTAxBFFFsBZItsMnMDksCLtrrwR7sGUaBWKyv08My0u0Wif
         yGjOGfqxmOk4KooXumzLepZ8V6zt3KO/5st4ymzzUqwV2z1eFkmey/1kmB19IvXzBHm2
         jWx+SSi0oQmVWhuPAzCSsUEFEM8pFTzq2WMNzSpX+wM9cpf6Qw5hZNFh6nnahx/RVy0+
         aALxR72ZvUmuw/eFjuz60wq6TALFhE+M6pd2RE1nqg1LfFzNY5JHyvfvmMxhTJQpvRvE
         5euA==
X-Forwarded-Encrypted: i=1; AJvYcCXVExLBfuymOSQkWYcJCqt6Hego2av4jJuOfR7r147YOidYZ7pT20Mq0RaxbWtcffcFtHIR/g==@linux.kernel.org
X-Gm-Message-State: AOJu0Yzub2TTQfgId+8jxgofBWj1UpbuqBdeiLn1wFMcdK/u7bbyUxKp
	B5maR96D3CD870G2EIlm4/ZPW6cGA9NhRsQG6Du1ewpWWOk2HCuVB1kfLNPXJEg65TUKaVGg2Q4
	dDTGjEwrqli73NQ9p2M5FqbzD6J6FB+o=
X-Gm-Gg: ATEYQzwJdAaoRjw02ZNXFXbvVmmB/K8eRgiVEFrapkjs72AshxXxq26SCi9vdFyAXoo
	s1/ob2k5SZPC+Wys2G6vCM9AYe4KsiVM+fEKdK/RrkHoz457Ib9MEW5ts6p9n6xZ/eETxgvZhXY
	vZ+PidZ3dB1vAsWOibU5sfwZwJqsujVoG63EGTqOx804a/vqCe2w7+neKus8C3gg0UwIFx6YJwT
	TpAIvD5c5BSIFEWKFynGW3eO97bLR29aq4nW7Ud7o8ka9toUQYNGnyp9n5KBMnwaQscRnIGzHrd
	8LEMfGSJsGpbVnyTBoQhefSWT14FsLuQ92/gq2FZHF0rc+WJ4cmGY9MI1YaeeYI=
X-Received: by 2002:ac8:5e4d:0:b0:509:1c90:e191 with SMTP id
 d75a77b69052e-50957ea6b4bmr224094081cf.51.1773762506934; Tue, 17 Mar 2026
 08:48:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
References: <CAFMMQGt-Dc4DiSNUYR1mQfUBswP9bmjyXfcvuy6HO57rZ79fHA@mail.gmail.com>
 <CAHC9VhS7nBWxZ0=1c_ec=Lq+J0CqZUGbriu2i==X7FciSw0K2g@mail.gmail.com>
In-Reply-To: <CAHC9VhS7nBWxZ0=1c_ec=Lq+J0CqZUGbriu2i==X7FciSw0K2g@mail.gmail.com>
From: Chuck Lever <chucklever@gmail.com>
Date: Tue, 17 Mar 2026 11:48:15 -0400
X-Gm-Features: AaiRm50wfo_3Q0RuHPrhGHa0gAWBrFL20QXVcscdRINZ8_f_mzlWK0W3X00vARE
Message-ID: <CAFMMQGvQU8FnuKduaSEpxAPuP=H52n-6HZ0uiM=WSWtEc_w63w@mail.gmail.com>
Subject: Re: Using "b4 prep" with Stacked Git
To: Paul Moore <paul@paul-moore.com>
Cc: Konstantin Ryabitsev <mricon@kernel.org>, users@linux.kernel.org, tools@linux.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 17, 2026 at 11:27=E2=80=AFAM Paul Moore <paul@paul-moore.com> w=
rote:
>
> On Tue, Mar 17, 2026 at 11:08=E2=80=AFAM Chuck Lever <chucklever@gmail.co=
m> wrote:
> >
> > Hi Konstantin -
> >
> > I'm a long-time Stacked Git and b4 user and I'm hunting for a tool to
> > juggle the many data items involved with posting kernel patch series
> > for review. "b4 prep" seems to fit that bill but it has some issues
> > when it comes to large cover letters with Stacked Git.
> >
> > The branch-description strategy is the least-bad option for StGit
> > right now, but it's fighting git's design -- git config was never
> > meant to hold multi-paragraph prose, and there's no way to tell StGit
> > "don't print the branch description in stg branch --list."
> >
> > A file-based strategy would solve all three problems cleanly. Something=
 like:
> >
> > .git/b4-cover/<branchname>/subject
> > .git/b4-cover/<branchname>/body
> > .git/b4-cover/<branchname>/changelog
> > .git/b4-cover/<branchname>/recipients
>
> Fellow stacked git fan here.
>
> I do something very similar with my own scripts/tools, and if I could
> offer a suggestion based on my experience, you might want to consider
> some slight naming tweaks to support multiple cover letters in a
> single branch.  It's common for me to use a single branch for multiple
> revisions of a patchset and being able to refer to previous cover
> letters without having to go to my email or lore is very handy.

I also sometimes use multiple cover letters per branch, but I just
considered that a bad personal habit ;-)


> This becomes easier if you include the To/CC, subject, body, and
> diffstat all in one file.  My cover letter tool formats and keeps the
> cover letter in a format that can be quickly copy-n-paste'd into my
> editor during 'stg email send --compose'.

I've been doing that by hand until now, in a single file. But that
requires tracking series version, In-reply-to, and other things that
"b4 prep" brings to the table automatically.

Sounds like one vote for "single unstructured file rather than
separate files". Would you send me your tool privately?


> > I'm asking before prototyping to see if you've already considered this
> > idea, might have another idea, or might have something already in the
> > works.
>
> I've built up a collection of shell scripts/tools built on top of
> stacked git over the years to match my preferred workflow, but I
> wouldn't consider them very pretty or something I would want to
> support.  However, I'm happy to share the basics ideas/concepts that
> I've found helpful :)

A bit off topic: I've been building a Claude skill for using Stacked
Git that encapsulates some of my habits and prevents Claude from
having to rediscover how to translate its git commands to Stacked Git
commands. It's here:

   https://github.com/chucklever/cel-kdev/blob/master/plugin/cel-kdev/skill=
s/stg/SKILL.md

I'd very much like to learn how others are using "stg" to incorporate
those ideas into the skill. Or, if someone knows of something
better...

--=20
Chuck Lever
