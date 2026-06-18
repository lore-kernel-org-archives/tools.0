Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B32A37AA65
	for <tools@linux.kernel.org>; Thu, 18 Jun 2026 12:31:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781785917; cv=none; b=MSMi/fcoqlV14RSMwljlSV+Ulh8ZfBbiStzaD9sMP0Sm6OmsmAcPxM3LFj2vcpOe5HHSLAem0daVTG/z/LW3VA86urJzGddjOQt/Js1S41W1RbQh7iiOZsbfHol/tdYMPBrcamxYC9HtrN4JhaJ9vH6N3bL4VDCSlhu2tiZZ83Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781785917; c=relaxed/simple;
	bh=15Q3rThKWRDaGWM76ggHs+WPsJjORKUGkMz1I5VhOHQ=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=WhG/+OJQs8i0VwI/aofmHLZsJPzJRIl9TjZGRfR4xKlkhOq5IDtQJLlBrF8IbMcsoyDpgq6E4u1+8oAh0ThT6wtmWMuXkrcXugLFroxQwS7g37xUCKGteSbUpWCgd8zvnol3jA9ukN19qreUSH9/SDicj+5APNs9FnLeur4Ek4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JAiypmEK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JAiypmEK"
Received: by smtp.kernel.org (Postfix)
	id 0A7421F01558; Thu, 18 Jun 2026 12:31:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87EA41F00AC4;
	Thu, 18 Jun 2026 12:31:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781785914;
	bh=pKAEs6O29Rns+nBMP3A6fcU2JX8DBp8CQRz5BIQY3YE=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=JAiypmEKwGJiZN3F59Mc9YRCG8wfR4quaqa5Ngi30iRbhlsH0LwC4+QB6VRAUFX/L
	 AJIhASCiSEA/kdGwp+KRtlMwtY7zzWwX4t8fJkNJDztVizjBozC01LV84xeOBgr+Fv
	 cTdLDA6AdJhHPEtQQbgxasYYxwT0YlaHh1Sikh2M2M+XZoemtqUeKDTR6x67Rk5f2A
	 wGa3BJ/KfXIFiwlqSSPbao6/EZQuiDiWISiPPVRc31sspYPbHiwJPWKWcfVyMFyoPP
	 F9rvgRr3bgWscBoRVuXggOMNKn+HGw2Yf/nmeW6NboyOVSJovOx8/NYg68SOzRm2do
	 5pEwWHYq949fA==
Message-ID: <a9e73c72b603e64724bf64fb1a7b4e6a045ed386.camel@kernel.org>
Subject: Re: kdevops-ng: graduating kdevops beyond Ansible
From: Jeff Layton <jlayton@kernel.org>
To: Daniel Gomez <da.gomez@kernel.org>, Luis Chamberlain
 <mcgrof@kernel.org>,  Chuck Lever <cel@kernel.org>
Cc: kdevops@lists.linux.dev, tools@kernel.org, GOST <gost.dev@samsung.com>, 
 Josef Bacik <josef@toxicpanda.com>, Amir Goldstein <amir73il@gmail.com>,
 Carlos Maiolino <cem@kernel.org>,  Chandan Babu R <chandanbabu@kernel.org>,
 David Sterba <dsterba@suse.com>, Song Liu <liu.song.a23@gmail.com>,  Scott
 Mayhew <smayhew@redhat.com>, Shin'ichiro Kawasaki
 <shinichiro.kawasaki@wdc.com>, Konstantin Ryabitsev	 <mricon@kernel.org>
Date: Thu, 18 Jun 2026 08:31:51 -0400
In-Reply-To: <9f64bee9-ecc3-4587-9645-2190223cbc4e@kernel.org>
References: <9f64bee9-ecc3-4587-9645-2190223cbc4e@kernel.org>
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

On Thu, 2026-06-18 at 11:30 +0200, Daniel Gomez wrote:
> kdevops is a framework for Linux kernel development and test automation.
> Its core features, namely workflow reproducibility, variability, and
> scalability, are delivered through Kconfig, the variability language,
> and Ansible, which provides host and guest idempotency along with
> workflow orchestration at scale, whether on baremetal, local VMs, or
> the cloud.
>=20
> kdevops supports rolling distributions such as Debian testing, Fedora,
> and openSUSE. Recently we extended Nix support, which raised the
> question: how do we drive Nix's declarative language from Ansible? We
> answered by wiring Nix in under Ansible and its templates, as one more
> way to declare host and guest environments. But that was the wrong
> framing: we had bolted Nix onto today's toolkit instead of rethinking
> it. Reproducibility and idempotency now come from Nix by construction,
> so I think Ansible's original reason for being in kdevops falls away.
> The better question is: how do we keep kdevops's core principles, lean
> on Nix, and drop Ansible?
>=20
> What remains once you do is not the configuration management plane. It
> is development workflow orchestration: build QEMU, build the kernel,
> build a guest rootfs/closure, boot it, run a test, collect results,
> diff against a baseline. That work is imperative and sequenced, work
> for a workflow engine, which is where tools like Windmill [1] come in.
> Windmill calls itself as "the fastest workflow engine" and an
> "open-source developer platform to power your entire infra and turn
> scripts into webhooks, workflows and UIs." Choosing to move kdevops
> onto Windmill would keep what made kdevops kdevops, namely workflows,
> quick bring-ups, baselines, and A/B regression detection, while trading
> Kconfig, Make, Ansible, and host-distro provisioning for typed
> run-forms, flows as code, and a worker queue. Nix supplies the
> environment, much like a container or venv/poetry, along with the guest
> OS system closure: declarative and portable. Windmill orchestrates the
> whole pipeline end to end, graduating kdevops into a fully reproducible,
> scalable, and configurable kernel-development framework, with both a UI
> and a CLI, that runs locally or in the cloud. Defined as code and driven
> by schedules and triggers, the same flows also make it a continuous
> integration pipeline. Because steps can be written in any language
> Windmill supports, including Ansible, Bash, Go, Python, and Rust,
> developers can not only use kdevops but extend it with their own
> scripts, turning it into a workflow hub. Note that choosing this path
> does not mean NixOS is required on the controller node; Nix is simply a
> runtime dependency that can be installed alongside your distro of
> choice.
>=20
> It'd be good to know what folks think about the possibility of evolving
> kdevops in this direction, deprecating Ansible along with Kconfig and
> Makefiles in favor of the new approach. To that end, I suggest a demo
> day where I can show why I think this is the next step worth taking, and
> whether it's a tradeoff users and maintainers are willing to make.
>
> If this is of interest and you'd like a look, I've ported equivalents of
> bootlinux (direct boot), qemu-build, and the systemd/QEMU bringup (QSU),
> plus an fstests run for XFS in the proof-of-concept demo project [2].
> You can also find some screenshots in [3].
>=20
> A note on licensing. Windmill's engine is AGPLv3; its OpenFlow flow
> format and client libraries are Apache-2.0. kdevops-ng runs Windmill
> unmodified and self-hosted as a separate service, and the flows and
> scripts are kdevops-ng's own copyleft-next-0.3.1 code, executed by
> Windmill rather than derived from it, so there shouldn't be any
> licensing concerns.
>=20
> [1] https://windmill.dev
> [2] https://github.com/dagomez137/kdevops-ng
> [3] https://github.com/dagomez137/kdevops-ng/tree/main/screenshots

Some thoughts:

I'd be interested to see the demo.  It's a little hard to make a
judgment about moving it in this direction without knowing specifically
what it would look like.  I took a quick look at the git repo and the
windmill site, but I don't really "get it" yet.

I do agree that kconfig/makefiles are not really suited to this task.
We've made it work, but it's a bit of a square peg in a round hole.

One of the things I liked is that kdevops spawns a normal (familiar)
distro, and that makes it easy to get in and troubleshoot when things
are broken. If I have to learn how to operate in yet another new
distro, I suppose I can, but it doesn't excite me.

OTOH, the goal here is kernel testing, so userland really doesn't
matter too much.
--=20
Jeff Layton <jlayton@kernel.org>
