Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F3383FD13F
	for <tools@linux.kernel.org>; Thu, 18 Jun 2026 14:02:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781791358; cv=none; b=V9Q9ehu5JCUuX2ghTUo7uE6nYN8J6WYn/B8rsAKazCiDGpQpRFCcmnoTDHUJSkU0YTEQ3O8oZ6xp3KgQ2k0NT3t/Dj2syKWNsEoqLxXFPlXQpuOii1X6v3NTba/qUhX/kBM0f8Y05pIVEGxnKByxNcqRDeWPt1hXtDtaPplP2y0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781791358; c=relaxed/simple;
	bh=i4mlfea/LxqSlPU4xS3YhB9oHPLSqpG/dKvkOSGZVaA=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=VTcnB7U1sakV6Q2h3RYbk8rrvCvkRS9iATinNFsVac5Gc/0uXuWyvXJRU2A/KNS18PXryT8r/aRhXxx8Fp8vQakOecYE9r5mu5WqA6jbi6jd8YFiQYKER+2cJfpf3pv5akRMga2F17KMzwyyGY2FgLhlvqnRqP3H8aiFtdWEXn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YlG6T5wv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YlG6T5wv"
Received: by smtp.kernel.org (Postfix)
	id 4937A1F00ACF; Thu, 18 Jun 2026 14:02:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C71B11F000E9;
	Thu, 18 Jun 2026 14:02:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781791355;
	bh=R4a3nRqyHaAokEuU1+a1J6U3jWh5Bg6cPBNcxGVzz0s=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=YlG6T5wvyt/4eQgqZOag4+0Le50j86f+vyQRfz1n8+gbuYehcu4lKa//IY2cPiWLF
	 QzOKrV6BXthCqt7/+5VVzjsiEYGmED6IaXEzOTY/aHlY8UcMxLyU9Q+7EkMHgdxHQm
	 6UmQEjCN2t/C5MCdI10OwHuQv6tuSkKoHmS1+o8a/Ck1bWWU8VuMaeRW/0Y/ZgCnCa
	 +EQo6ELjz2lSdM2a3MQ7d92HKAP5uBTOXZjlWFJm3K+JJ3ExjsV31dDTGhvGVtEp8o
	 r+pBz1wHwmj/NVgef7u4MYZJ6GlLRCKoUbnHGgCt4bDuajhGn4XmVThkB2eblAtMMm
	 pr+KYorj3BUrQ==
Message-ID: <6d1db9869a4dfb7f0c5fa82b93211e2768a1ce51.camel@kernel.org>
Subject: Re: kdevops-ng: graduating kdevops beyond Ansible
From: Jeff Layton <jlayton@kernel.org>
To: Chuck Lever <cel@kernel.org>, Daniel Gomez <da.gomez@kernel.org>, Luis
 Chamberlain <mcgrof@kernel.org>
Cc: kdevops@lists.linux.dev, tools@kernel.org, GOST <gost.dev@samsung.com>, 
 Josef Bacik <josef@toxicpanda.com>, Amir Goldstein <amir73il@gmail.com>,
 Carlos Maiolino <cem@kernel.org>,  Chandan Babu R <chandanbabu@kernel.org>,
 David Sterba <dsterba@suse.com>, Song Liu <liu.song.a23@gmail.com>,  Scott
 Mayhew <smayhew@redhat.com>, Shin'ichiro Kawasaki
 <shinichiro.kawasaki@wdc.com>, Konstantin Ryabitsev	 <mricon@kernel.org>
Date: Thu, 18 Jun 2026 10:02:31 -0400
In-Reply-To: <244ce59c-c2ad-46a6-9753-488a48063a74@app.fastmail.com>
References: <9f64bee9-ecc3-4587-9645-2190223cbc4e@kernel.org>
	 <244ce59c-c2ad-46a6-9753-488a48063a74@app.fastmail.com>
Autocrypt: addr=jlayton@kernel.org; prefer-encrypt=mutual;
 keydata=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
 QZIQXVeAA+smfTT0tDrisj1U5x6ZB9b3nBg65kc=
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44) 
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0

On Thu, 2026-06-18 at 09:22 -0400, Chuck Lever wrote:
> On Thu, Jun 18, 2026, at 5:30 AM, Daniel Gomez wrote:
> > kdevops is a framework for Linux kernel development and test automation=
.
> > Its core features, namely workflow reproducibility, variability, and
> > scalability, are delivered through Kconfig, the variability language,
> > and Ansible, which provides host and guest idempotency along with
> > workflow orchestration at scale, whether on baremetal, local VMs, or
> > the cloud.
> >=20
> > kdevops supports rolling distributions such as Debian testing, Fedora,
> > and openSUSE. Recently we extended Nix support, which raised the
> > question: how do we drive Nix's declarative language from Ansible? We
> > answered by wiring Nix in under Ansible and its templates, as one more
> > way to declare host and guest environments. But that was the wrong
> > framing: we had bolted Nix onto today's toolkit instead of rethinking
> > it. Reproducibility and idempotency now come from Nix by construction,
> > so I think Ansible's original reason for being in kdevops falls away.
> > The better question is: how do we keep kdevops's core principles, lean
> > on Nix, and drop Ansible?
> >=20
> > What remains once you do is not the configuration management plane. It
> > is development workflow orchestration: build QEMU, build the kernel,
> > build a guest rootfs/closure, boot it, run a test, collect results,
> > diff against a baseline. That work is imperative and sequenced, work
> > for a workflow engine, which is where tools like Windmill [1] come in.
> > Windmill calls itself as "the fastest workflow engine" and an
> > "open-source developer platform to power your entire infra and turn
> > scripts into webhooks, workflows and UIs." Choosing to move kdevops
> > onto Windmill would keep what made kdevops kdevops, namely workflows,
> > quick bring-ups, baselines, and A/B regression detection, while trading
> > Kconfig, Make, Ansible, and host-distro provisioning for typed
> > run-forms, flows as code, and a worker queue. Nix supplies the
> > environment, much like a container or venv/poetry, along with the guest
> > OS system closure: declarative and portable. Windmill orchestrates the
> > whole pipeline end to end, graduating kdevops into a fully reproducible=
,
> > scalable, and configurable kernel-development framework, with both a UI
> > and a CLI, that runs locally or in the cloud. Defined as code and drive=
n
> > by schedules and triggers, the same flows also make it a continuous
> > integration pipeline. Because steps can be written in any language
> > Windmill supports, including Ansible, Bash, Go, Python, and Rust,
> > developers can not only use kdevops but extend it with their own
> > scripts, turning it into a workflow hub. Note that choosing this path
> > does not mean NixOS is required on the controller node; Nix is simply a
> > runtime dependency that can be installed alongside your distro of
> > choice.
> >=20
> > It'd be good to know what folks think about the possibility of evolving
> > kdevops in this direction, deprecating Ansible along with Kconfig and
> > Makefiles in favor of the new approach. To that end, I suggest a demo
> > day where I can show why I think this is the next step worth taking, an=
d
> > whether it's a tradeoff users and maintainers are willing to make.
> >=20
> > If this is of interest and you'd like a look, I've ported equivalents o=
f
> > bootlinux (direct boot), qemu-build, and the systemd/QEMU bringup (QSU)=
,
> > plus an fstests run for XFS in the proof-of-concept demo project [2].
> > You can also find some screenshots in [3].
> >=20
> > A note on licensing. Windmill's engine is AGPLv3; its OpenFlow flow
> > format and client libraries are Apache-2.0. kdevops-ng runs Windmill
> > unmodified and self-hosted as a separate service, and the flows and
> > scripts are kdevops-ng's own copyleft-next-0.3.1 code, executed by
> > Windmill rather than derived from it, so there shouldn't be any
> > licensing concerns.
> >=20
> > [1] https://windmill.dev
> > [2] https://github.com/dagomez137/kdevops-ng
> > [3] https://github.com/dagomez137/kdevops-ng/tree/main/screenshots
>=20
> Agreed that Ansible is evolving faster than is convenient for us
> and kdevops' use of it seems to be laden with technical debt.
>=20
> I don't object at all to creative forward thinking, and I am not
> outright objecting to the proposal, but my concerns are:
>=20
> + How much development effort is this? I have nearly zero time to
>   work on kdevops these days. Even with AI assistance, this seems
>   like an enormous task.
>=20

Ditto. I'm mostly a user of kdevops these days and don't have as much
time to work on it.

> + Also as a user of kdevops, this means I would have to spend a
>   lot of time I don't have learning the new configuration shapes
>   and figuring out how to migrate my current CI to them. That's
>   not inviting.
>=20
> + What would cloud support look like in a post-Ansible world? I
>   don't think Nix has impact on the cloud aspect of kdevops, and this
>   proposal seems to shift Nix into the role of the primary kdevops
>   virtualization method. Should we simply split kdevops into an "all
>   local virtualization" project and an "all cloud virtualization"
>   project that go their separate ways? Tying cloud and local together
>   seems to be a frequent source of chafing.
>=20

It does.

OTOH, some parts of kdevops (the test running bits, in particular) are
mostly agnostic to the backend where it's being run. I don't think we
want to have to replicate that part.

Maybe we need to split the whole thing into two -- one part that does
the bringup and setup, and one part that does the test running?

> + I'd rather see a focus on addressing the technical debt of
>   continuing to support distributions that no one uses any more,
>   and moving away from requiring root to run local virtualization
>   by installing kdevops from a package. Those are narrower work
>   items that offer a bigger bang-for-buck. (You might argue that
>   Nix solves the latter problem already).

I already don't run as root for local virtualization. I thought
everyone did? Some of the initial setup requires root, but that's sort
of a separate problem.
--=20
Jeff Layton <jlayton@kernel.org>
