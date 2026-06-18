Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42749381B0A
	for <tools@linux.kernel.org>; Thu, 18 Jun 2026 13:22:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781788970; cv=none; b=CuDsRYc9cjY/2mTGPwa1n5hHYm0xgnHdIH1ZTL6eDm1MRczGNDZL9cu8uuI6/7PsZkOwlddhtBs8YbcXhLXd9snp6DtoN08m3VQ2n+2mihydSOcHhXnkh0boRoBGvH9Bd2TovX+eET6BVZsheCbh5pLwDQcBFKQz0XLWhnQ6sH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781788970; c=relaxed/simple;
	bh=EycgeeGWBhz05OHyjHLHXCJzETGro1eTQEj3QAgfqnY=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=axGRJ1rDPRlgsBYszLxQXawfUSP7KZeRHKlZIOKvtC3IiPWwpM+ZU1vGvPVMtzN4bdyRnAg/BpZQZXfFKp4h7oIqDLo8ym+3BVKgzi+48I07sQOUYYgRebmvlmW13jNe+dQp159N2ykX28qHsibrDNmvGipj4jrMRAbzL08O1ho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VXXfHWMo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VXXfHWMo"
Received: by smtp.kernel.org (Postfix)
	id 18A1E1F00A3E; Thu, 18 Jun 2026 13:22:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 843151F00A3D;
	Thu, 18 Jun 2026 13:22:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781788969;
	bh=xmXlqEBh550GQcZ7g6HhdQ2OYbyX1diPI6lPQxQ0LLw=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject;
	b=VXXfHWMocOab/oXPcWwu4VDGbZ5CjHEaddcYqpr6ktE1OrL2SDclrMQ4GIxGv7CXU
	 H17GkoxF/GuwAE0kH5ZFNAGdr13lmhXNG/JLRYQKbANxc+Co4sdw/a+8Cu9/sYcypS
	 sIHA5lHFrQ/h9lmP5D623FQIepJ+mubOqZ/adGJdrCNcw6YC/1hw/e/8aEiI5BuVB+
	 gmgLVuUuSeDrqpgB0qWVJmI/xD3Kft+oZKdb4QPOqFo2qXY503VGTIY8Insg+GAULi
	 TiEsWSecuMdxf4FBgLnOxhmyy9DI/HjXpWqgvLkv/3fLzn7HZ4Qrox533L0JZi5R+s
	 paEzkB5ZySZHw==
Received: from phl-compute-10.internal (phl-compute-10.internal [10.202.2.50])
	by mailfauth.phl.internal (Postfix) with ESMTP id ABFE9F40069;
	Thu, 18 Jun 2026 09:22:47 -0400 (EDT)
Received: from phl-imap-15 ([10.202.2.104])
  by phl-compute-10.internal (MEProxy); Thu, 18 Jun 2026 09:22:47 -0400
X-ME-Sender: <xms:J_EzaqvpmeIQRI0cl8QJ1E78_WeGPevhIY9R9JWD3EWjA3hUyYG-aQ>
    <xme:J_EzaqTzqlLUDoBjKYR5sYq_jvreAPG8iaMxnOUgddhyhgCdgiVVDW3BOAzam_3x_
    jyH3VmHRFqD48LIkSJLww7ghjIRz1uUPq2Np6BEFf_n3A4m0MZFSSM>
X-ME-Proxy-Cause: dmFkZTGXFAHWd6xTOThvMi0hR2qyezXIMMgtkRFuomi71gfukRh4EQoQcEdmy9L3UcN1m+
    nTbf3obLsqv+c5KiI9soCGWF61j/oaFpgxE47PtjF65DVJQKPyT4OE+ewGkXdwWhYJ0gs2
    f8ZFqeSSftFbg1dhrA3iekiMBg6JjqkIJRUMammbwG1zyfZnAhr3h34XNe6w/eQXfXci4g
    +MbxcHkfSGA9L4oXlO6jaOYlZo6X5f1bfarMjxM5CXDwbgXrx0vYDg1ZzXVWSXbhxsoCuJ
    9N/5EZiWmS6MZYi3WuMMyHDN6HNf07VncdjptAFDuNmAvwbyy3+zKOWZL3FI0FQd5gfbFG
    HxNEhe8eaxCnCDrYtL9VcfVadqPUzFKeH6hZ67lT4oblFd3xboPwKCr5IDirocAr2alIKS
    VD5RP516d5f5qrX2FyEH/UZ+s4sDUUeGL3ynpGwdpZcGQttvYch7kDrXzKvsBKD0/OxZG2
    McNK1BAOJvazyif8EBmkCowbdJtFqXSYvv+VeRQnrFv7ec+vR2VHPpeZyQoRh/pBGePWby
    7QHWGI7diyGLSI9n83F6DGFMjquffwsU5PhL7hjy87RN263A0grrSl2/pxk6QRQPsy8Xvr
    rXZb8feJDuVgL7VF5cGYACJj4Cnc4jIp2heDA2DrcO9Fy7SK+En/grPxfglQ
X-ME-Proxy: <xmx:J_EzavcOcIriU8htrlyzLvBmJWJfDDFYGik67BAY-ADsWuld1BCN_Q>
    <xmx:J_EzavldESSyP6IOC2ejuCABfmqaK3ESXigSDidZiyvNI0quuD3LPw>
    <xmx:J_EzaupYJTK97-SicYs-fNkPDK5Tz_q5bY7FlTrQN-IwVn10KrVhbA>
    <xmx:J_EzasE76OY2KwaEWYQrRmNVnZerkm4rAjGHIQukJBw3x975OhlUxg>
    <xmx:J_EzakTcp_4RrfxGELmCWYtppkrf3irNhUOXH-MdnSMTTgyBAnN-fHL9>
Feedback-ID: ifa6e4810:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 81D73780070; Thu, 18 Jun 2026 09:22:47 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
X-ThreadId: Aapm04DAnaOw
Date: Thu, 18 Jun 2026 09:22:27 -0400
From: "Chuck Lever" <cel@kernel.org>
To: "Daniel Gomez" <da.gomez@kernel.org>,
 "Luis Chamberlain" <mcgrof@kernel.org>, "Jeff Layton" <jlayton@kernel.org>
Cc: kdevops@lists.linux.dev, tools@kernel.org, GOST <gost.dev@samsung.com>,
 "Josef Bacik" <josef@toxicpanda.com>, "Amir Goldstein" <amir73il@gmail.com>,
 "Carlos Maiolino" <cem@kernel.org>,
 "Chandan Babu R" <chandanbabu@kernel.org>, "David Sterba" <dsterba@suse.com>,
 "Song Liu" <liu.song.a23@gmail.com>, "Scott Mayhew" <smayhew@redhat.com>,
 "Shin'ichiro Kawasaki" <shinichiro.kawasaki@wdc.com>,
 "Konstantin Ryabitsev" <mricon@kernel.org>
Message-Id: <244ce59c-c2ad-46a6-9753-488a48063a74@app.fastmail.com>
In-Reply-To: <9f64bee9-ecc3-4587-9645-2190223cbc4e@kernel.org>
References: <9f64bee9-ecc3-4587-9645-2190223cbc4e@kernel.org>
Subject: Re: kdevops-ng: graduating kdevops beyond Ansible
Content-Type: text/plain
Content-Transfer-Encoding: 7bit


On Thu, Jun 18, 2026, at 5:30 AM, Daniel Gomez wrote:
> kdevops is a framework for Linux kernel development and test automation.
> Its core features, namely workflow reproducibility, variability, and
> scalability, are delivered through Kconfig, the variability language,
> and Ansible, which provides host and guest idempotency along with
> workflow orchestration at scale, whether on baremetal, local VMs, or
> the cloud.
>
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
>
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
>
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
>
> A note on licensing. Windmill's engine is AGPLv3; its OpenFlow flow
> format and client libraries are Apache-2.0. kdevops-ng runs Windmill
> unmodified and self-hosted as a separate service, and the flows and
> scripts are kdevops-ng's own copyleft-next-0.3.1 code, executed by
> Windmill rather than derived from it, so there shouldn't be any
> licensing concerns.
>
> [1] https://windmill.dev
> [2] https://github.com/dagomez137/kdevops-ng
> [3] https://github.com/dagomez137/kdevops-ng/tree/main/screenshots

Agreed that Ansible is evolving faster than is convenient for us
and kdevops' use of it seems to be laden with technical debt.

I don't object at all to creative forward thinking, and I am not
outright objecting to the proposal, but my concerns are:

+ How much development effort is this? I have nearly zero time to
  work on kdevops these days. Even with AI assistance, this seems
  like an enormous task.

+ Also as a user of kdevops, this means I would have to spend a
  lot of time I don't have learning the new configuration shapes
  and figuring out how to migrate my current CI to them. That's
  not inviting.

+ What would cloud support look like in a post-Ansible world? I
  don't think Nix has impact on the cloud aspect of kdevops, and this
  proposal seems to shift Nix into the role of the primary kdevops
  virtualization method. Should we simply split kdevops into an "all
  local virtualization" project and an "all cloud virtualization"
  project that go their separate ways? Tying cloud and local together
  seems to be a frequent source of chafing.

+ I'd rather see a focus on addressing the technical debt of
  continuing to support distributions that no one uses any more,
  and moving away from requiring root to run local virtualization
  by installing kdevops from a package. Those are narrower work
  items that offer a bigger bang-for-buck. (You might argue that
  Nix solves the latter problem already).

-- 
Chuck Lever
