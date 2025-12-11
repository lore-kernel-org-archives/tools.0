Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47379433A6
	for <tools@linux.kernel.org>; Thu, 11 Dec 2025 03:17:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765423078; cv=none; b=Fgr0SYcBw2r376LmPgHeE8SxKZ6z9v5QXe1D4+XVD6Gis7lWhiXVMO3IFCSBp//ehzn8mKVTJeSm80K4FmG7wRqNXBBK7P7Qr4x/FkSBIVLGqDJIWNZFpuIKRJ+DEFLWNPWYT/KYROfqHmdACd4+OvCZv0aEid8yOB2ORCAVylk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765423078; c=relaxed/simple;
	bh=4diicEtKoqSVoBlYCDeHr/H2Czye2NSBA5QSXo3n9pE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TyyXek2TpS2eFevQneY3swyirZncHUXGmtM9MGEicsGDC9w+Wf166aV8iojFnTm9oLO9qZPN6ZpIZN76kxatGqjDNHsnfsZfK1ku1yLDrEPEW82Mncl62qbGSYah7M2U/5ZDI8Xe0K8174NJpp099xQSbAg1rnOWdAzoN984O3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ikZkFHXT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ikZkFHXT"
Received: by smtp.kernel.org (Postfix)
	id 09187C113D0; Thu, 11 Dec 2025 03:17:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD1E6C19421
	for <tools@kernel.org>; Thu, 11 Dec 2025 03:17:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765423077;
	bh=4diicEtKoqSVoBlYCDeHr/H2Czye2NSBA5QSXo3n9pE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ikZkFHXT8jf92ZmETlNZTnSAfBE+ZxcZiH3s9osoAwLJN8dkJBr9ReiSgo0WCQd8h
	 ttGFbKGsW6F6XWEHMYucrB6tN4AseYiwxsR2lqSlvf8qjXbXxvSt/GXn+WsZc7DbLS
	 I0r9hsX0dgbHtr0XHw22WByxCUj4/iyCLhhP73Q9wwhCNU6g6MqbsCJ6Pc8Leontph
	 m2Kl/AMB50SilB3rRZCZ2i7f0AvJskqgsgVRY6xD2LGuOzj6IbzKvoR2cTiJ9p2qVW
	 CzCTta3A9B8bAG+bIA+q43or7rq5owtDhiN7OajJHcDlqrvtUnFXhbRrCeRL1prhpj
	 jwTDlwwSkouzQ==
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-640aaa89697so781866a12.3
        for <tools@kernel.org>; Wed, 10 Dec 2025 19:17:57 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUOPwDRdwp1kqEMDjR6tqOrCr/8r/NJ2TYyOZeKGwMJ/dje3HKS9sjhh6Hse/pGVSXOGFgl0A==@kernel.org
X-Gm-Message-State: AOJu0YwL4gV2TowU1iRMfm8NB0zzffWBVY9QMtCwq7FK2GjYre7IHmkf
	Rw4LbIMGdkGtw0rptHykfJJRz0kEPjkiih4uttT54HQdoUlJJEbtU5DXbp1ttp+1BLG3f3h6KEN
	fGjhhcOiHWMFop9/JH7MsnH/Nkw7CBQ==
X-Google-Smtp-Source: AGHT+IGT/sjLd56LsihcV5FgyT0VMCqFUj6wE3k6E1VTYVnEe4I3DlM9kwYpDdPw0GmhjbP1NVQwOtdyiiBQt/d6RVA=
X-Received: by 2002:a05:6402:40d1:b0:640:b814:bb81 with SMTP id
 4fb4d7f45d1cf-6496d5c8bd6mr4272713a12.32.1765423076426; Wed, 10 Dec 2025
 19:17:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
References: <20251105-mottled-bizarre-marmoset-b055ae@lemur>
In-Reply-To: <20251105-mottled-bizarre-marmoset-b055ae@lemur>
From: Rob Herring <robh@kernel.org>
Date: Wed, 10 Dec 2025 21:17:45 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+yvzTU6ibC_nNsadSoWMJ2SLknpBMoSFBt2zKoCAX9Rg@mail.gmail.com>
X-Gm-Features: AQt7F2pTkC6CKuMV9SDu7awXgjozQX9HJOcEG_EERG5e_dpXlwlzlLNNkxkIRzU
Message-ID: <CAL_Jsq+yvzTU6ibC_nNsadSoWMJ2SLknpBMoSFBt2zKoCAX9Rg@mail.gmail.com>
Subject: Re: korgalore: a tool to put lore/lei messages directly into gmail
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: users@kernel.org, tools@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Konstantin,

On Wed, Nov 5, 2025 at 12:36=E2=80=AFPM Konstantin Ryabitsev
<konstantin@linuxfoundation.org> wrote:
>
> Hello:
>
> TL;DR: korgalore lets you pull mailing lists directly from lore and put t=
hem
> into your gmail inbox via gmail API. It can do the same with lei searches=
.
>
> Docs are here:
> https://korgalore.docs.kernel.org/

I'm trying to get a lei query to work with this. The gmail setup is
all good as yank works fine.

The first issue is that the 'master' branch is hardcoded, but git has
switched the default branch to 'main' in newer versions (I'm on 2.51).
I just did a s/master/main/ in korgalore to work-around that.

After that, I still don't get any messages.

I create this query:

lei q -t -o v2:/home/rob/lei/my-patches
--only=3Dhttps://lore.kernel.org/all --dedupe=3Dmid '(dfn:drivers OR
dfn:sound OR dfn:tools OR dfn:kernel OR dfn:arch OR dfn:Documentation
OR dfn:include OR dfn:scripts) AND f:robh@kernel.org AND
rt:3.month.ago..'

Then run 'kgl pull':

debug: Loading config from /home/rob/.config/korgalore/korgalore.toml
debug: Config loaded with 1 targets and 1 sources
debug: Data directory: /home/rob/.local/share/korgalore
debug: Processing list: lei-my-patches
debug: Running git command: git -C /home/rob/lei/my-patches/git/0.git show-=
ref
debug: Epoch 0 refdata: 9cf28456372cc07cf84f337ae4ee066f94b2072d refs/heads=
/main
debug: Running git command: git -C /home/rob/lei/my-patches/git/0.git
rev-list -n 1 main
debug: Running git command: git -C /home/rob/lei/my-patches/git/0.git
show -s --format=3D%ci 9cf28456372cc07cf84f337ae4ee066f94b2072d
debug: Running git command: git -C /home/rob/lei/my-patches/git/0.git
show 9cf28456372cc07cf84f337ae4ee066f94b2072d:m
Initialized: lei-my-patches.
Pull complete with no updates.

Then I do a 'lei edit-search' to get more messages because I won't get
new messages otherwise, and run pull again:

debug: Loading config from /home/rob/.config/korgalore/korgalore.toml
debug: Config loaded with 1 targets and 1 sources
debug: Data directory: /home/rob/.local/share/korgalore
debug: Processing list: lei-my-patches
debug: Running git command: git -C /home/rob/lei/my-patches/git/0.git show-=
ref
debug: Epoch 0 refdata: 9cf28456372cc07cf84f337ae4ee066f94b2072d refs/heads=
/main
debug: Running lei-up on list: lei-my-patches
debug: Running git command: git -C /home/rob/lei/my-patches/git/0.git show-=
ref
debug: Epoch 0 refdata: 42c36f6d0cde3902e679fec019007639b2bdf6aa refs/heads=
/main
debug: Running git command: git -C /home/rob/lei/my-patches/git/0.git
cat-file -e 9cf28456372cc07cf84f337ae4ee066f94b2072d^
debug: Running git command: git -C /home/rob/lei/my-patches/git/0.git
rev-list --reverse --ancestry-path
9cf28456372cc07cf84f337ae4ee066f94b2072d..main
debug: Found 131 new commits for list lei-my-patches
critical: Failed to process LEI list "lei-my-patches": 'NoneType'
object has no attribute 'get_message_at_commit'
Pull complete with no updates.

This is fixed with this change:

diff --git a/src/korgalore/cli.py b/src/korgalore/cli.py
index a578e4d93a52..0b62c67bc217 100644
--- a/src/korgalore/cli.py
+++ b/src/korgalore/cli.py
@@ -122,7 +122,7 @@ def process_commits(listname: str, commits:
List[str], gitdir: Path,
         logger.info('Limiting to %d messages as requested', max_count)
         commits =3D commits[-max_count:]

-    ls =3D ctx.obj['lore']
+    ls =3D ctx.obj['lei']
     cfg =3D ctx.obj.get('config', {})

     details =3D cfg['sources'][listname]


But I still don't have anything from the original query.


Finally, is there a way to get a maildir from the same query directly
from lei? I suppose I could just use offlineimap from gmail or just
setup a second identical query, but neither of those seem ideal.

Rob
