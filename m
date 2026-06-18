Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 319573D9030
	for <tools@linux.kernel.org>; Thu, 18 Jun 2026 09:30:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781775036; cv=none; b=E8ISlSq44006TRJN2YxGJCrB54QIXX8oJr6DBV35LXXe08tAcdP7T7YVFAk1yr8oQQtq+AqVriquTBH3Lsh6XW3G5n0ZNX/oh9ua042ppL2Wi9ygPGthwLJ/tR7pOsiuPlCKYY+sUgf5llLrdPbxg6Vy72LmvXfe9i5MyZzxHE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781775036; c=relaxed/simple;
	bh=xf9tWsdl52kcPVqLvhhTCcPe2LSMwdIZqh+4/VCjkUY=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=uISpczI198wHHLGHgLAfwbcWfqtHde6QC61TzYdT5G9msbLViyea94Y5ptIOGjhr5Mfbg8KIlp2X0oZ5/hU6MYaf6Oi7L1euW9Qcu2UA5JBUN6gzRGdVNCotYQjr3FruZdSsTNQXcD86WLejPUlM4EVp3D+jJ5dp/yMbUr4K3MA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o1qojMyT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o1qojMyT"
Received: by smtp.kernel.org (Postfix)
	id 032CF1F00A3F; Thu, 18 Jun 2026 09:30:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFA941F000E9;
	Thu, 18 Jun 2026 09:30:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781775034;
	bh=xf9tWsdl52kcPVqLvhhTCcPe2LSMwdIZqh+4/VCjkUY=;
	h=Date:To:Cc:From:Subject;
	b=o1qojMyTxg8zvttjzNfu1aVZ6lf/ox+qpozElzKRlPZRSEmhcx6y4PkaGnkCB+EsM
	 3Q6z2LX/MNWgUdn04AzqPFIc6tobGhJYFU+Ijr+sFkCgvz6vOTfTqUDsAhnMYm0jQ2
	 yjBJVLUWhcmHu03alY1cmNKBJiTbuJe67GO0j4oItd3svGd8TpEXS3GU9YYvMlMTjg
	 0sDUpC+LG5pAw60zbybeGE7+fScKxsSreeLmd79IqDqHnbA8j9Fff6i67mhIiO0S/D
	 3xDhSdLBlRDEPjgpH8K/17X05bFx89rnsipOfUW4vqwxny8BiTA/0ZVV72W0+KFya6
	 ELlvg/MTNj6LA==
Message-ID: <9f64bee9-ecc3-4587-9645-2190223cbc4e@kernel.org>
Date: Thu, 18 Jun 2026 11:30:30 +0200
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Luis Chamberlain <mcgrof@kernel.org>, Chuck Lever <cel@kernel.org>,
 Jeff Layton <jlayton@kernel.org>
Cc: kdevops@lists.linux.dev, tools@kernel.org, GOST <gost.dev@samsung.com>,
 Josef Bacik <josef@toxicpanda.com>, Amir Goldstein <amir73il@gmail.com>,
 Carlos Maiolino <cem@kernel.org>, Chandan Babu R <chandanbabu@kernel.org>,
 David Sterba <dsterba@suse.com>, Song Liu <liu.song.a23@gmail.com>,
 Scott Mayhew <smayhew@redhat.com>,
 Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>,
 Konstantin Ryabitsev <mricon@kernel.org>
From: Daniel Gomez <da.gomez@kernel.org>
Subject: kdevops-ng: graduating kdevops beyond Ansible
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

kdevops is a framework for Linux kernel development and test automation.
Its core features, namely workflow reproducibility, variability, and
scalability, are delivered through Kconfig, the variability language,
and Ansible, which provides host and guest idempotency along with
workflow orchestration at scale, whether on baremetal, local VMs, or
the cloud.

kdevops supports rolling distributions such as Debian testing, Fedora,
and openSUSE. Recently we extended Nix support, which raised the
question: how do we drive Nix's declarative language from Ansible? We
answered by wiring Nix in under Ansible and its templates, as one more
way to declare host and guest environments. But that was the wrong
framing: we had bolted Nix onto today's toolkit instead of rethinking
it. Reproducibility and idempotency now come from Nix by construction,
so I think Ansible's original reason for being in kdevops falls away.
The better question is: how do we keep kdevops's core principles, lean
on Nix, and drop Ansible?

What remains once you do is not the configuration management plane. It
is development workflow orchestration: build QEMU, build the kernel,
build a guest rootfs/closure, boot it, run a test, collect results,
diff against a baseline. That work is imperative and sequenced, work
for a workflow engine, which is where tools like Windmill [1] come in.
Windmill calls itself as "the fastest workflow engine" and an
"open-source developer platform to power your entire infra and turn
scripts into webhooks, workflows and UIs." Choosing to move kdevops
onto Windmill would keep what made kdevops kdevops, namely workflows,
quick bring-ups, baselines, and A/B regression detection, while trading
Kconfig, Make, Ansible, and host-distro provisioning for typed
run-forms, flows as code, and a worker queue. Nix supplies the
environment, much like a container or venv/poetry, along with the guest
OS system closure: declarative and portable. Windmill orchestrates the
whole pipeline end to end, graduating kdevops into a fully reproducible,
scalable, and configurable kernel-development framework, with both a UI
and a CLI, that runs locally or in the cloud. Defined as code and driven
by schedules and triggers, the same flows also make it a continuous
integration pipeline. Because steps can be written in any language
Windmill supports, including Ansible, Bash, Go, Python, and Rust,
developers can not only use kdevops but extend it with their own
scripts, turning it into a workflow hub. Note that choosing this path
does not mean NixOS is required on the controller node; Nix is simply a
runtime dependency that can be installed alongside your distro of
choice.

It'd be good to know what folks think about the possibility of evolving
kdevops in this direction, deprecating Ansible along with Kconfig and
Makefiles in favor of the new approach. To that end, I suggest a demo
day where I can show why I think this is the next step worth taking, and
whether it's a tradeoff users and maintainers are willing to make.

If this is of interest and you'd like a look, I've ported equivalents of
bootlinux (direct boot), qemu-build, and the systemd/QEMU bringup (QSU),
plus an fstests run for XFS in the proof-of-concept demo project [2].
You can also find some screenshots in [3].

A note on licensing. Windmill's engine is AGPLv3; its OpenFlow flow
format and client libraries are Apache-2.0. kdevops-ng runs Windmill
unmodified and self-hosted as a separate service, and the flows and
scripts are kdevops-ng's own copyleft-next-0.3.1 code, executed by
Windmill rather than derived from it, so there shouldn't be any
licensing concerns.

[1] https://windmill.dev
[2] https://github.com/dagomez137/kdevops-ng
[3] https://github.com/dagomez137/kdevops-ng/tree/main/screenshots
