Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14B6214ABE
	for <tools@linux.kernel.org>; Thu, 18 Jun 2026 21:58:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781819938; cv=none; b=T1TSpNUahjEZBCUzuDqKf+7zVcLcXjiyQQi7C/PomNoTlyYpxmJcUe77XwAGzbDYGolCxGwwcw78TvQ8pBl5zoF6u1C8/xz8ZdkEQlis9J9toQPHoKmD2Zg3taHFwvx9bVMckj9KJuRfTkFZgiYjVpTIPpamU7Ep+7ORRYD8Upo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781819938; c=relaxed/simple;
	bh=WJHtw0GIQxYsOUoYZdlvj449eKmn8cFPWhCc2I0lSE0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lCD3gJB4qwPZu3WIWFLt6fl5anDjeNUvGAwpP/SdEk/pk7nAI8853oJCq04Tq90rE89CN1COTjCvoXpmI4qCTAsZ8MctSGoP93bulq0e1XN90qtJasAueKAimJuw4MjPUTcnyuE/pc9ZTkiZJpoCsfUkeeVlpRVMuhf/4U+v4TI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lpBvcUTM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lpBvcUTM"
Received: by smtp.kernel.org (Postfix)
	id E56941F00ADB; Thu, 18 Jun 2026 21:58:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3AD81F000E9;
	Thu, 18 Jun 2026 21:58:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781819936;
	bh=XkEzmCTIYq00JeZcpCRLidvLGtccWCCoiCXRJV4ivSA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=lpBvcUTMMVRfw4+JUOk4OK8QG9hbugNQyFMHxRwmfLI3E+L4zKcs4VvRy8lmkAaVo
	 i3j7wbePvW3/dOF29vDvSDJBve4wLd+UC78V7DSyGZQU/dHVtvtqDqUx+lPj6Z9h+d
	 D/CPPIu9IiKQweKXrLssX2TNRk4g8yzPgDqpfrC6wnyIRdK6/JSGhUT1MvX8L8u5mX
	 sAgGACNyq+krg+j5ypVAylFaU0ipx9Up2yF+8QiflE9iwjLt4us9bvVbSDbFKRTA0B
	 W/Q9ZPAC7shAitttbapEYS9pEIzmN9aFjPywbjFzOI5c9UfcYNEBq1z3J13eX33W8s
	 gAKGb0M6nVd/A==
Message-ID: <5b9777ac-64e7-4e93-ba16-90d1077812f4@kernel.org>
Date: Thu, 18 Jun 2026 23:58:52 +0200
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: kdevops-ng: graduating kdevops beyond Ansible
To: Chuck Lever <cel@kernel.org>, Daniel Gomez <da.gomez@kernel.org>,
 Luis Chamberlain <mcgrof@kernel.org>, Jeff Layton <jlayton@kernel.org>
Cc: kdevops@lists.linux.dev, tools@kernel.org, GOST <gost.dev@samsung.com>,
 Josef Bacik <josef@toxicpanda.com>, Amir Goldstein <amir73il@gmail.com>,
 Carlos Maiolino <cem@kernel.org>, Chandan Babu R <chandanbabu@kernel.org>,
 David Sterba <dsterba@suse.com>, Song Liu <liu.song.a23@gmail.com>,
 Scott Mayhew <smayhew@redhat.com>,
 Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>,
 Konstantin Ryabitsev <mricon@kernel.org>
References: <9f64bee9-ecc3-4587-9645-2190223cbc4e@kernel.org>
 <244ce59c-c2ad-46a6-9753-488a48063a74@app.fastmail.com>
Content-Language: en-US
From: Daniel Gomez <da.gomez@kernel.org>
In-Reply-To: <244ce59c-c2ad-46a6-9753-488a48063a74@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 18/06/2026 15.22, Chuck Lever wrote:
> 
> On Thu, Jun 18, 2026, at 5:30 AM, Daniel Gomez wrote:
> 
> + How much development effort is this? I have nearly zero time to
>   work on kdevops these days. Even with AI assistance, this seems
>   like an enormous task.

You're right that it's large, but not all of it needs to migrate. I
wouldn't move libvirt or libguestfs unless people actually want it; the
main thing that path buys you is the auto-generated UI [1].

Workflows could be migrated as-is, since Ansible is one of the languages
Windmill runs, but I think most of them are entangled with libvirt and
9p. If we're not migrating libvirt/libguestfs, porting the workflows
verbatim doesn't make sense either; the effort is better spent rewriting
them in whichever Windmill language fits (Bash, Python, Rust, ...). The
ones that are already decoupled should convert fairly straightforwardly.

One thing I should have made clearer in the cover: I lean on systemd as
the process manager, not just for QSU (QEMU in systemd), but also to run
the test suites themselves, e.g. the fstests check script as a systemd
unit. That keeps the "scripts" simple while still being powerful.

I do think the rewrite into Nix/Windmill (Bash/Python/Rust/whatever)
plus systemd is worth it. Until then, both worlds can coexist.

Link: https://www.windmill.dev/docs/script_editor/customize_ui [1]

> 
> + Also as a user of kdevops, this means I would have to spend a
>   lot of time I don't have learning the new configuration shapes
>   and figuring out how to migrate my current CI to them. That's
>   not inviting.

Agreed, the learning curve is real. The upside is that migrating also
gives you CI essentially for free: the same flows, run on Windmill's
workers and schedules, are the CI.

> 
> + What would cloud support look like in a post-Ansible world? I>   don't think Nix has impact on the cloud aspect of kdevops, and this

Correct.


>   proposal seems to shift Nix into the role of the primary kdevops
>   virtualization method. 

Correct.

> Should we simply split kdevops into an "all
>   local virtualization" project and an "all cloud virtualization"
>   project that go their separate ways? Tying cloud and local together
>   seems to be a frequent source of chafing.

Good question. The same tension arguably applies to the Nix/QSU world
versus the Debian/Fedora/openSUSE + libvirt/libguestfs world. But I
don't think kdevops is really about which tools you use underneath; it's
a broader framework and idea, the same principles applied as a
kernel-development framework whatever the technology beneath. So rather
than splitting by tooling, I'd keep the framework and let the backends
differ.

> 
> + I'd rather see a focus on addressing the technical debt of
>   continuing to support distributions that no one uses any more,
>   and moving away from requiring root to run local virtualization
>   by installing kdevops from a package. 

That's exactly why QSU was merged, and I'm very happy with the
transition. Guests now run as systemd user services with virtiofsd
instead of 9p, with all the QEMU knobs I need and KVM acceleration, and
no libvirt permissions or qemu:///session vs qemu:///system headaches.

That said, fully unwiring the controller setup and the sudo escalations
is tedious, significant work for relatively little reward. I do reach
this paths even with QSU.


> Those are narrower work
>   items that offer a bigger bang-for-buck. (You might argue that
>   Nix solves the latter problem already).

Roughly, yes: Nix solves the reproducibility part, on both the
controller and guest sides, and QSU sidesteps the libvirt permission and
SELinux/apparmor sudo configuration steps.

BTW, on the cloud side with Nix I came across terranix [2], which lets
you describe Terraform/Opentofu infrastructure in the Nix language. And
either way, once a cloud guest is up you can just install Nix on it and
run the same paths as in local virtualization, so the workflow layer is
identical regardless of which deployment users choose. Only the bringup
differs.

Link: https://terranix.org/docs/what-is-terranix/ [2]
