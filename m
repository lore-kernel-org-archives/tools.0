Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C98318800E
	for <tools@linux.kernel.org>; Tue, 17 Sep 2024 13:39:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726580394; cv=none; b=J6XwRHO4oUpJGPN7Xcl2cjzBgf6enAw1IZoJFK+9ctLFYYYQFyLAKWNLmvwtd3dN+9T81pYpUOQD7Lb2YkFVdB37ptBnRJ8jNr2zrZH5t+tjEH3dgykhLvr/OcpDd4KB1A5pbNSOMrpPcgLIRvd+7Pa9FB8VG/cdL++DGphVUkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726580394; c=relaxed/simple;
	bh=/i9CrI+cqE9l/NTS74dDfLp2ZfARpXUaWgzbrzmFZkE=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Q9H9dDBfIiKB5eXZLA/O6D+V8nhF1Y6zXk/9tJS+lEopMJod60Lvs/xLth55IeF3YM+OgwYpCrAycMTjMNQfqOauwpip8p55bMn5hheFKPQTWHvM2C1l2AW/3MecDT2ES1jwFjiyRcW+9esARE/mLnl1JzkXhNAW60GVrTzxblU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=xJAdhr2t; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="xJAdhr2t"
Received: by smtp.kernel.org (Postfix)
	id 09ED7C4AF09; Tue, 17 Sep 2024 13:39:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B103C4CECD;
	Tue, 17 Sep 2024 13:39:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1726580393;
	bh=/i9CrI+cqE9l/NTS74dDfLp2ZfARpXUaWgzbrzmFZkE=;
	h=Date:From:To:Subject:From;
	b=xJAdhr2t0OlHdAFCcm7zOnqp96hjc/rIxIC3IbmeKpR4VxwbKT6SRJwD9YxUjPDGQ
	 tRUc0DMeG98TAK5eErnlBSS56OkfodvH5LkQBVch8wc9dqz/7JlHhOUjjfsya0PXzc
	 fIkwu/l2iGcQECkboOKsSQHaa/BAtdgJ7LqCheqY=
Date: Tue, 17 Sep 2024 09:39:51 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: tools@kernel.org, users@kernel.org
Subject: b4 version 0.14.2 released
Message-ID: <20240917-intrepid-idealistic-chachalaca-dbc1a9@lemur>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hello, all:

B4 version 0.14.2 is out. This is a bugfix release focusing on the following
identified issues:

- fixes "b4 am/shazam" sometimes pulling in bogus trailers
- fixes "b4 send" treating message-ids as email addresses to cc
- fixes "prep-perpatch-check-cmd" for custom checkpatch configurations
- fixes "b4 send" expanding prerequisites in incorrect order

Thank you to the following people for their help with this release, in
reverse-log order:

- Louis Chauvet <louis.chauvet@bootlin.com>
- Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
- Brandon Maier <brandon.maier@collins.com>
- Kevin Hilman <khilman@baylibre.com>
- Geert Uytterhoeven <geert@linux-m68k.org>

Shortlog is below:

Brandon Maier (2):
      Fix prep-perpatch-check-cmd in .b4-config
      Report ecode and stderr from check commands

Konstantin Ryabitsev (10):
      Add some debug calls for trailer-map matching
      trailer_map: add a few more debug statements and a possible fix
      trailer_map: further debugging and attempted fix
      trailer_map: don't walk down from the cover letter
      Update version to 0.14.2-dev
      ez: add X-Change-ID header
      ez: fix prereq expanding for series specified by message-id
      Properly pass nocache when querying thread
      ez: use a temporary workdir when preparing sent tags
      Bump version to 0.14.2 in prep for a release

Louis Chauvet (1):
      Remove message-id from cc list

Manos Pitsidianakis (1):
      Create patches with --full-index --binary

-K
