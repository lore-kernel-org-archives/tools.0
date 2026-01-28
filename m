Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C7913191C9
	for <tools@linux.kernel.org>; Wed, 28 Jan 2026 17:12:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769620343; cv=none; b=jAJBETsVr3g8WYYzUM2a8obwgLS4fSteUvtjW2SteLBNJVGJqv+W+Dx8lRged7A4JefHc2iwTF4LODR+9JcV7/Mr+N+Uu8bmsGxx76u/N05duWyWcNjGfdtPJylHL+vMJ6YQ1Uguxq2ib+yR/pouZY3VdUxLM1ZAtyI7o/RDDso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769620343; c=relaxed/simple;
	bh=ouVfGxicVm6yLuI/w1hv777/drJVqHgkCZdK3zkiYn8=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=foarVuoOnIGGfi4oFf3+iUQpnhyKFAITG2puIe2O9925nVvghxyO7AyFi+48DHAUdS43SSFWguVnmnCVuqkltenl8UNacNUCprT2kJCCaujouZ7UkLmhrwCI96h+KoLtYCXK9oSb0tEZqC9gji9K74LRzsgxggd5ndzWJJeRX9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XA380fgn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XA380fgn"
Received: by smtp.kernel.org (Postfix)
	id E99DFC116C6; Wed, 28 Jan 2026 17:12:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A48C6C4CEF1;
	Wed, 28 Jan 2026 17:12:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769620342;
	bh=ouVfGxicVm6yLuI/w1hv777/drJVqHgkCZdK3zkiYn8=;
	h=Date:From:To:Subject:From;
	b=XA380fgnY1j7bvqO7tS9AUiHhLNoDtRj7hPY+oL1ai6hkd2dwCSmmeJ482VrzAs7L
	 JNQcf8Hkqgocx8AWepncE/yvX7X54BkLteVWikJ63YHpffd1/sLcHaN54ure6dl8MR
	 VQR6CA8zkXQWlndCv1nYJRslhPiqnVRNLuQeTkvnjW/unlOb7gPX2sJ3Xe+jV4tnvF
	 m5ueVydYnE3pjAUzBagt3JX/D2ud0abvzpC8mrCthaql+BA5+BdLd6TGCpe8MEw4yX
	 KxqZjHg5WnCd0JekpJmkJDZWzwgGduSNEGYsE2vu0nqcSe/zzfAvMuUL0vpwC933Rk
	 RbCCXhMERMNSQ==
Date: Wed, 28 Jan 2026 12:12:21 -0500
From: Konstantin Ryabitsev <mricon@kernel.org>
To: users@kernel.org, tools@kernel.org
Subject: korgalore v0.5 now available
Message-ID: <20260128-tangible-bouncy-hyrax-277711@lemur>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi, all:

Korgalore v0.5 is now available with message deduplication, subfolder support,
and several improvements to make it easier to organise delivered messages.

New features
------------

Message-ID deduplication for JMAP and IMAP:

Before importing a message, JMAP and IMAP targets now check if a message with
the same Message-ID already exists in the target folder. This prevents
duplicate messages when the same email arrives via multiple mailing lists or
deliveries. Gmail already deduplicates automatically via its API, so this
brings JMAP and IMAP to parity.

Subfolder support for IMAP and Maildir:

A new "subfolder" parameter at the delivery level allows routing messages to a
target folder or directory without creating separate targets for each folder.
For IMAP, it combines the base folder with the subfolder path (e.g., INBOX +
Lists/LKML becomes INBOX/Lists/LKML). For Maildir, it creates subdirectories
under the base path.

Maildir subfolders additionally support strftime format codes (e.g., %Y/%m)
for date-based directory organisation, so you can set up automatic archiving
like "Archive/2026/01". Templates are validated at startup and refreshed before
each GUI sync to ensure long-running processes use the correct folder.

X-Korgalore-Trace header:

Messages now include a provenance header when delivered to targets, which helps
identify message origin when the same email arrives via multiple paths. The
format is: 

    X-Korgalore-Trace: from feed=<feed> for delivery=<delivery>; v<version>; <RFC 2822 date>

Configuration options:

- main.user_agent_plus: append a unique identifier to the User-Agent string
  sent to remote servers, which helps server operators identify traffic from
  specific korgalore installations.
- main.catchall_lists: customise which mailing lists are excluded from
  track-subsystem queries; the defaults are for Linux kernel subscribers

Improvements
------------
- track-subsystem no longer requires -m/--maintainers; it automatically looks
  for ./MAINTAINERS in the current directory and falls back to fetching from
  kernel.org (cached for 24 hours).
- track-subsystem now excludes catch-all lists (linux-kernel,
  patches@lists.linux.dev) by default to avoid flooding results.
- Centralised User-Agent handling across all remote connections (git, lei,
  HTTP).
- GUI now redirects stdout/stderr to /dev/null and logs only critical messages
  to the systemd journal, preventing I/O errors when the terminal is closed
  after launching with "kgl gui &".
- New korgalore.toml(5) manpage documenting the configuration file format.

Bug fixes
---------
- Maildir target now creates parent directories if they don't exist. Python's
  mailbox.Maildir only creates the maildir structure (cur/new/tmp), not parent
  directories.

Full changelog and documentation:

    https://korgalore.docs.kernel.org/

Source repository:

    https://git.kernel.org/pub/scm/utils/korgalore/korgalore.git

Install via pipx:

    pipx install korgalore

Thanks to the following people for suggestions and reports addressed in this
release:

- Ard Biesheuvel (message deduplication suggestion)
- Dirk Behme (maildir parent directory bug report)
- Mark Brown (track-subsystem catch-all list filtering suggestion)

-K
