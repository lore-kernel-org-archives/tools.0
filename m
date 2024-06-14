Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 829881487C7
	for <tools@linux.kernel.org>; Fri, 14 Jun 2024 19:26:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718393183; cv=none; b=RKVrX/g7McHnrvfn6oaDKaN8/aTzorGU6SmMUjyY3eJzioMhD7X0LzARa9xwAMR7QP9xWYLV19f36q95AFTppIErvWyL3xDFpDaSQitWbrIgZ0HtvNqBybFKuHCTHJTxFHUc/wKMDYhIRysAwEDrk4o6H9b0SYNJioe8qUzQSVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718393183; c=relaxed/simple;
	bh=v9S/GvFfHFwnSvTvqSMG8dIkU7p+r55y4tB9Hw1rLIw=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=REAp0qC42KSug/zsAd/3heaByjwzuW8HwZtHAMYx5TMDB2SwH6ewmqBWMvgsIHW22+WdXKHiFBM7T+LsHofa6ZdM3kkrGAQRB1hXwag+0HgKHNn40p9Sx6gcFGPF9Kivl7GU/h76vvV1+ye2RAu78KOCt4IRWJYmkCDXPYzHn/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=WgZLHtR1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="WgZLHtR1"
Received: by smtp.kernel.org (Postfix)
	id 403CAC4AF1D; Fri, 14 Jun 2024 19:26:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC372C2BD10;
	Fri, 14 Jun 2024 19:26:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1718393183;
	bh=v9S/GvFfHFwnSvTvqSMG8dIkU7p+r55y4tB9Hw1rLIw=;
	h=Date:From:To:Subject:From;
	b=WgZLHtR1bBAX2i1IJUnWB3/ixCzcQmV9dy3+e76X3Ct6agbtK9BAzOGcVaPXyIbGe
	 sqspOEzkRWyIGk6jNC81WQ0dreakC+ZpJ7pQfziFvw45Bz7XK/aRgw5fZTF3cIYAg4
	 OCqHTO+O1u5dRDZQGqjriKxMhPKCTLfG8K+Gsi/8=
Date: Fri, 14 Jun 2024 15:26:21 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: tools@kernel.org, users@kernel.org
Subject: b4 0.14.0 available
Message-ID: <20240614-flashy-inquisitive-beaver-ddcfea@lemur>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hello, all:

I am happy to announce b4 version 0.14.0. There are several new features in
this release, alongside many smaller fixes and feature improvements.

# Integrated checks

Both maintainer and contributor side of things are now capable of running some
basic checks, though it's probably the contributors who will find this more
useful.

## b4 prep --check

When working on a new series to submit upstream, contributors can now run:

    $ b4 prep --check
    Checking patches using:
      ./scripts/checkpatch.pl -q --terse --no-summary --strict --showfile --mailback
    ---
    ● c44e5720fc50: serial: exar: adding missing CTI and Exar PCI ids
    ● 7d0281ff188d: serial: exar: add support for reading from Exar EEPROM
      ● checkpatch.pl: drivers/tty/serial/8250/8250_exar.c:140: CHECK: Please don't use multiple blank lines
      ● checkpatch.pl: drivers/tty/serial/8250/8250_exar.c:209: CHECK: Alignment should match open parenthesis
    [...]
    ---
    Success: 3, Warning: 39, Error: 0

Full documentation for this option is available here:
https://b4.docs.kernel.org/en/stable-0.14.y/contributor/prep.html#checking-your-work
and
https://b4.docs.kernel.org/en/stable-0.14.y/config.html#contributor-oriented-settings

## b4 am/shazam --check

Similarly, you can now run checkpatch on the series you download, though the
default setting may not be as useful to some subsystems:

    $ b4 am --check -o/tmp 20240614171428.968174-1-kris.van.hees@oracle.com
    [...]
    ---
      ✓ [PATCH v4 1/3] kbuild: add mod(name,file)_flags to assembler flags for module objects
        ● checkpatch.pl: passed all checks
      ✓ [PATCH v4 2/3] kbuild, kconfig: generate offset range data for builtin modules
        ● checkpatch.pl: 274: WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
      ✓ [PATCH v4 3/3] module: add install target for modules.builtin.ranges
        ● checkpatch.pl: passed all checks
      ---
      ✓ Signed: DKIM/oracle.com
    ---
    Total patches: 3

If patchwork integration is configured, ``--check`` will also attempt to
retrieve any CI status from the server.

Full documentation is available here:
https://b4.docs.kernel.org/en/stable-0.14.y/maintainer/am-shazam.html#common-flags
and
https://b4.docs.kernel.org/en/stable-0.14.y/config.html#am-and-shazam-settings

## b4 send pre-flight checks

Another contributor-oriented change is the "pre-flight checks" that will
validate that certain steps have been properly performed (such as running
auto-to-cc after modifying patches). They can be tweaked or turned off
entirely in the config file:
https://b4.docs.kernel.org/en/stable-0.14.y/config.html#contributor-oriented-settings

# Series dependencies

Another large feature is the introduction of series dependencies. If you are
working on a patch series to submit upstream, but know that it is dependent on
another series that has not yet been merged, you can specify it as a
dependency using one of the following keys:

- series change-id
- the message-id of a previously submitted series
- the patch-id of a specific patch in a submitted series

During send, these dependencies will be resolved into prerequisite-patch-id
basement trailers that is expected by tooling. Contributors can use the
``--check-deps`` command to verify that all dependencies can be properly
resolved or to see if there are newer series versions available.

Full documentation for this feature is available here:
https://b4.docs.kernel.org/en/stable-0.14.y/contributor/prep.html#working-with-series-dependencies

# Other features in this release

- b4 prep --add-prefixes : lets you add prefixes to those already defined
- b4 trailers --since-commit [commitish]: lets you find any new trailer
  updates to commits you have already applied to your tree
- automatically recognize standalone patches : if a patch is posted in the
  middle of a larger discussion, b4 will try to automatically recognize that
  situation and ignore the rest of the thread (automatically applies
  --no-parent)
- other small tweaks and updates : for details, see
  https://git.kernel.org/pub/scm/utils/b4/b4.git/tree/plan.otl?h=stable-0.14.y

# Updating

If you installed via pip, you can upgrade using:

    pip install --upgrade b4

If you're using b4 via the git checkout, you can either update to latest
master, or checkout the new stable-0.14.y branch. You can also download signed
tarballs from the usual location:

    https://kernel.org/pub/software/devel/b4/

# Special thanks

As usual, thank you to the following people who all helped with the release
(in the reverse-changelog order):

- Lee Jones
- Quentin Schulz
- Chen-Yu Tsai
- user dumitruceclan on Github
- Mark Brown
- Linus Torvalds
- Mattijs Korpershoek
- Lucas De Marchi
- Zhao Mengmeng
- Louis Chauvet
- Andrew Cooper
- Akihiko Odaki
- Emil Velikov
- Will Deacon
- Nicolin Chen
- Philippe Blain

Everyone's contribution is greatly appreciated!

Best wishes,
-K
