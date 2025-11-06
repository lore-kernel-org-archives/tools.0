Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05D5215442C
	for <tools@linux.kernel.org>; Thu,  6 Nov 2025 00:20:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762388415; cv=none; b=PBSD+nIO64I8ElJ1cnivf8VfiYWne/PDBecpjpuuK3Tli2D/mUZs/BuVBwYKrvjTpACw37RygoxFpI3RK4mb1x6T10w/LDIzR4qsx2+eE8V8wVHImZh4C3JmlXENBngFhYK8eGr559+ml7M463aKwSvQEr2B7hblXkEMtvH2gg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762388415; c=relaxed/simple;
	bh=62rxqmNqoeFSYZHsXAqRIh/q8nEbQ3v0kSKTTVEM88o=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Ymlu+i8xQtXePat9mkjHY1erLBkB44GNcfKKMGDZaXQcaqF28NNWsKkK13/wkWFv53PPuqC3EKt0CN2dIrQZgAxW+ofgxclMhjTKLs7GlfGXEJm8dOx72r7f/oqJ9FMd+Xv6v4tz2lfD3Ic+nSD0fejNQFqDyI9M1ruXWbrzJZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lQec+gpB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lQec+gpB"
Received: by smtp.kernel.org (Postfix)
	id A55D1C4CEF5; Thu,  6 Nov 2025 00:20:14 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 64F30C4CEF8
	for <tools@kernel.org>; Thu,  6 Nov 2025 00:20:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 64F30C4CEF8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762388413; x=1793924413;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=62rxqmNqoeFSYZHsXAqRIh/q8nEbQ3v0kSKTTVEM88o=;
  b=lQec+gpBFdpsNky2/3zzcoxfgEZHJ/+NrbRgOhDQMxfR7cjWK3wdnoGx
   hFsRx6zpnk/5d0RHWibp02jgKptGF1dbIOQrBKS8ebyygNwmNjZartd4W
   pZcQdUeElEPzCxc+7y+PvEZWx3bgfIw1vmE1fiQ5RleheQzMDROtezV9v
   N8d3sjFeZ0lWpm/rkrSVk58Kfzi5NEAScTi1S0LM4Sdiepxa6RHmBpsyB
   MvPVD50iEgX2AtrgDQ9oGWX8RZHe0yBojHPE11shtdnbHbQUyxhox0Tej
   mwEGOCLYVuUAriDEMGOG3he5C44GkstyahO723MM1rx7dFXl1fgYZIeg8
   A==;
X-CSE-ConnectionGUID: UfK8I9USSfCi7sdmS8A5qQ==
X-CSE-MsgGUID: wWP3r1EARJqN/6zVC4gzQQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11604"; a="75200136"
X-IronPort-AV: E=Sophos;i="6.19,283,1754982000"; 
   d="scan'208";a="75200136"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2025 16:20:13 -0800
X-CSE-ConnectionGUID: EWRN/TTjQvei0z0yxR0dgQ==
X-CSE-MsgGUID: WUVNlQUiSKqABlE+zwxZFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,283,1754982000"; 
   d="scan'208";a="218263678"
Received: from c02x38vbjhd2mac.jf.intel.com ([10.88.27.157])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2025 16:20:13 -0800
From: Marc Herbert <marc.herbert@linux.intel.com>
To: tools@kernel.org
Subject: Switch b4/README.txt to "pipx install" instead of "pip install"?
Date: Wed, 05 Nov 2025 16:20:11 -0800
Message-ID: <m2wm44ui4k.fsf@C02X38VBJHD2mac.jf.intel.com>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


Following the current b4/README.txt instructions on any recent Linux
distribution (approx. less than 2 years old) fails instantly with the
well-known "externally managed" error https://peps.python.org/pep-0668/


$ python3 -m pip install b4
error: externally-managed-environment

=C3=97 This environment is externally managed
=E2=95=B0=E2=94=80> To install Python packages system-wide, try apt install
    python3-xyz, where xyz is the package you are trying to
    install.
=20=20=20=20
    If you wish to install a non-Debian/Arch/etc.-packaged Python package,
    create a virtual environment using python3 -m venv path/to/venv.
    Then use path/to/venv/bin/python and path/to/venv/bin/pip. Make
    sure you have python3-full installed.
=20=20=20=20
    If you wish to install a non-Debian packaged Python application,
=3D=3D> it may be easiest to use pipx install xyz, which will manage a    <=
=3D=3D=3D=3D=3D pipx =3D=3D=3D=3D=3D
    virtual environment for you. Make sure you have pipx installed.
=20=20=20=20
    See /usr/share/doc/python3.12/README.venv for more information.


I've been using pipx for months and it Just Works. As stated, it
automates creating, entering and leaving the virtualenv.

I just tested Ubuntu 22.04. It's old enough not to fail like this
(preferring to... actually and silently "break system packages" instead)
but pipx also works just fine on it.

So, should the README simply switch to "pipx install"?

References:
- https://lwn.net/Articles/959236/
- https://repology.org/project/pipx/versions
- https://peps.python.org/pep-0668/

  ------


Also, I'm not an expert but I think installing from source is probably
better done like this:

git clone --recursive b4
cd b4
pipx install -e .

This allows running any version _and_ from the checkout directory
without depending on any "b4.sh" indirection.  The main difference is:
dependencies are isolated/protected in the virtualenv. Some users may
want this, others not.

Anyway that's another debate further down the line.

