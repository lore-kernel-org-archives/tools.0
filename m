Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E1A722D4C3
	for <tools@linux.kernel.org>; Thu, 18 Jun 2026 21:52:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781819568; cv=none; b=NN2GhQdCRCjxIMF4lAUj9tumiHUhTVP3YqfKRtzWkqDCF6hfmsMQ/Ak6j1P5h6c2mdZBEufHsjNHjoU7PKdZb4IamQTd9kAK172X8yMllFjDAD1XfaGo/ew3GSzgG/EpDxRGvsCdDwRPd8AghGXclD4TIIU/J3VOhvKIKe2XzBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781819568; c=relaxed/simple;
	bh=5jTkHQhpEcCg29oSXNuFbOma2EpzEzG20YwopGGN1sw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=o7UPRDkWUFu0zK08cNmEUVsOZ21XijKxRziXv6UorwDEf/BPm7bZiS2XzkVWpAynGQbbPuDNM9WQkJ1JS7IvJ6SI04WoKDelmLLGTqpCp+psXGK5HThbjdGN7qFsnwEU6WHzj6woWXsZN755fNy6kdV3wQt1PkN1QnyGTGoqbQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O5ZONKz0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O5ZONKz0"
Received: by smtp.kernel.org (Postfix)
	id 01C881F00AC4; Thu, 18 Jun 2026 21:52:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 191541F00A3D;
	Thu, 18 Jun 2026 21:52:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781819566;
	bh=G6cQs3TxuQfOdbvIRU/5rlZb5+qzIrPN08c/7VWJYWw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=O5ZONKz0LozKWgr+OExhxG/DR4SyN+LHy5HvoC3z+4Q1F2tVXCPJVe5wD6rKzXepk
	 M/SPWb7/+kMK8wVoaVzCxlCZ2Fati853lRVa7LlFBJHZ8UT7flluIp7dCooGQKxCEo
	 fliwLHiLQa20a7HirxrABmJuqPWIsvYJfIBkTZRzFulosOFyTx2lmG1Xm0ZrsWMuw8
	 SSteYztyj2LXkgVM/X7upoCgBlYxkLhBF2s7O0AiX/xUfgVqtJ0chWcEtqnFNzCb2L
	 eT65cKyjqkpms6xRQn1/sUV1QJE0NP2DGM6NDy3p5HgGd3d5XGo1UHQ4tLJ2J4/yoT
	 XB37hm6RwdPoA==
Message-ID: <0795e3e1-6c4e-4de0-a62a-6b03ce0c88ce@kernel.org>
Date: Thu, 18 Jun 2026 23:52:41 +0200
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: kdevops-ng: graduating kdevops beyond Ansible
To: Jeff Layton <jlayton@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>,
 Chuck Lever <cel@kernel.org>
Cc: kdevops@lists.linux.dev, tools@kernel.org, GOST <gost.dev@samsung.com>,
 Josef Bacik <josef@toxicpanda.com>, Amir Goldstein <amir73il@gmail.com>,
 Carlos Maiolino <cem@kernel.org>, Chandan Babu R <chandanbabu@kernel.org>,
 David Sterba <dsterba@suse.com>, Song Liu <liu.song.a23@gmail.com>,
 Scott Mayhew <smayhew@redhat.com>,
 Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>,
 Konstantin Ryabitsev <mricon@kernel.org>
References: <9f64bee9-ecc3-4587-9645-2190223cbc4e@kernel.org>
 <a9e73c72b603e64724bf64fb1a7b4e6a045ed386.camel@kernel.org>
Content-Language: en-US
From: Daniel Gomez <da.gomez@kernel.org>
In-Reply-To: <a9e73c72b603e64724bf64fb1a7b4e6a045ed386.camel@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 18/06/2026 14.31, Jeff Layton wrote:
> On Thu, 2026-06-18 at 11:30 +0200, Daniel Gomez wrote:
> Some thoughts:
> 
> I'd be interested to see the demo.  

Great! I will send an invite if this thread moves forward.

> It's a little hard to make a
> judgment about moving it in this direction without knowing specifically
> what it would look like.  I took a quick look at the git repo and the
> windmill site, but I don't really "get it" yet.

100%.

AFAIK, even Windmill itself struggles a bit to position what it is in
the market. But I think they get some obviously useful things right for
developer workflow orchestration that nobody else does. BTW, before
landing on this project I also looked at others: cijoe [1], Kestra,
and, at a different level, task.dev and just.systems. And these are the
alternatives Windmill compares itself against [2], in case any of them
are familiar to you (none were to me).

For a quick sense of what Windmill is, here's their architecture
diagram: https://www.windmill.dev/docs/misc/architecture

The way I think of it: a GitLab runner plus the YAML pipeline in
.gitlab-ci.yml (or the GitHub Actions equivalent), but for your
development workflows, not your project's CI. Though it can obviously be
used for project's CI too. All in one package, with far more pipeline
("flow", in Windmill terms) features [3]. That last part is one that I'm
also interested in: we could turn kdevops into a kernel regression
workflow engine with git-bisect and generate reports we can submit
directly to the mailing list and maintainers (similar to 0-day). Yes, we
can already do this today with Luis's patches from last year (I tried
them and they work), but it's exactly the kind of workflow where you can
see Ansible isn't the right tool.

Link: https://cijoe.readthedocs.io/en/latest/# [1]
Link: https://www.windmill.dev/docs/compared_to/peers [2]
Link: https://www.windmill.dev/docs/core_concepts#flow-specific-features [3]

> 
> I do agree that kconfig/makefiles are not really suited to this task.
> We've made it work, but it's a bit of a square peg in a round hole.
> 
> One of the things I liked is that kdevops spawns a normal (familiar)
> distro, and that makes it easy to get in and troubleshoot when things
> are broken. If I have to learn how to operate in yet another new
> distro, I suppose I can, but it doesn't excite me.

I understand, and I'm 100% with you: Nix (+ Windmill) is simply too
many new things at once.

The real benefit here is that the guest and the controller run the exact
same environment. You could compare it to virtme-ng with overlayfs,
where, AFAIK, you boot a guest off the host's rootfs (read-only, with
an overlay for writes), so the guest mirrors the host. The difference is
that with virtme-ng that shared environment is still whatever Debian or
Fedora you happen to be running, so it isn't pinned or reproducible;
with Nix it's the same shared environment (same /nix/store).

A way forward could be to use Windmill as the Ansible, Makefile, Kconfig
replacement or the Nix-based paths, and keep the current toolkit for the
libvirt/libguestfs/Terraform paths. Both can coexist.

> 
> OTOH, the goal here is kernel testing, so userland really doesn't
> matter too much.

But we also need changes on userland test suites so I think it matters
too. I use Nix for exactly that, to build and pin custom versions
of the test suites and tools (e.g. fstests, fio, bcc, etc.) that I can
run either baremetal or in a VM. The benefit is that the host and guest
share the same /nix/store (the guest mounts it over virtiofs), so a tool
you build on the host is the exact same build the guest runs.
