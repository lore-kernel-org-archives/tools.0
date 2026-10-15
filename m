Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C91C547061
	for <tools@linux.kernel.org>; Thu, 15 Oct 2026 00:04:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792022656; cv=none; b=saEG6WiriHYdw/yO8EgC7wcDc7+qY+DktR1AefA9uHVWcrtzuHlVHi6P9kLr5kQogBw3a8LOhrob26XhUyfA1L7UXynBZc57uzH9Cu0A/fVxB1hGRgIVD+MLaPfQoJepCz5Y3nywis2QKGdTyLu5Vo++sP9HnREI/E/2rjN9xxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792022656; c=relaxed/simple;
	bh=USYblx5fZ8X6A+Yo4I4C8UpjysxyoRH6tbWiZCIXWUc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ODmehz/yO9kmqGG691uPoo2f2ATVOs0Qkc8UIoc6gWWdcZ2AOw1+gJsyuZKxok0FZkY1ccoBq0mUCEXv37mEyGImgDiFYDIuwjfd5gMwZBfwZo4P9h/9y87e2TaT0SA+9SdXz79csBJP44mWY+bvaJQh/xmKz2nEQXLBk3rVURQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T40u6rdf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T40u6rdf"
Received: by smtp.kernel.org (Postfix)
	id F20EB1F000C6; Thu, 15 Oct 2026 00:04:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 794FF1F000C4;
	Thu, 15 Oct 2026 00:04:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792022655;
	bh=yfDghx4z1X781aC2VX6nxdTQZGlh4SmuIyjrblB8gI8=;
	h=From:Subject:Date:To:Cc;
	b=T40u6rdfO2R3n10MrBDIGk+laVdFNsvFkT518A8GuJI/zdxV+lapIJv9TdNRTJ0A8
	 cI/htuyWsY0QfHCC5mYHMLBnIdj1qM2jAczmkgDK1or/NYZgRAgkfmG4c5VDxTQ7H2
	 4gwEquFZks1IiSllsoPY6RZ2iw1Sxj6AY0qiGtWspo8PVqLqclzAdDk8pU0ZZRCNN0
	 K10C8s7Q6abQDLTt0eIHii9W43MecCv7i+JRYU/qiSZGe8Na6aQDEnjA1r6kJbKcfy
	 DWKG1DFzRg652Us2yXmVSHlg1c/9Ktbxrs8KfCsM6yyjLlzCoW4TvoSLIY8QpKdNfi
	 FAcOClcW8cGYA==
From: Brian Masney <masneyb@kernel.org>
Subject: [PATCH b4 0/4] review-tui: add support for setting the delegate in
 patchwork
Date: Wed, 14 Oct 2026 20:03:37 -0400
Message-Id: <20261014-pw-delegate-v1-0-a393ae92152a@kernel.org>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWMyw6CMBQFf4WctU24vPVXjIsWDnCNQdKikBD+3
 arLmWRmR6BXBlySHZ5vDfqcIsgpQTvaaaDRLjKyNKsklcLMq+n44GAXGidNWZ5zK01eIxazZ6/
 b73aFK3D7u/Byd7bLd4Pj+ACckS9vcwAAAA==
X-Change-ID: 20261014-pw-delegate-b185593a1837
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, Brian Masney <masneyb@kernel.org>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=921; i=masneyb@kernel.org;
 s=20250903; h=from:subject:message-id;
 bh=USYblx5fZ8X6A+Yo4I4C8UpjysxyoRH6tbWiZCIXWUc=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLIuSFTn8bc8CavX/7NU+N7VsBQuS8H9h0osHLd716ysr
 Fnip3e/o5SFQYyLQVZMkWVJrlFBROoq23t3NFlg5rAygQxh4OIUgIkIyTIybHzG27zwh/Frhl9X
 Mw9HVB1o641Ubbl/SLXC5mxfelReLSPDb4GqWTcWW04P1ZPP72f352ZZmt70rkWTI+NPpnjVdn1
 WAA==
X-Developer-Key: i=masneyb@kernel.org; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

Here's a series that adds support for setting the delegate in patchwork
via the review-tui.

Signed-off-by: Brian Masney <masneyb@kernel.org>
---
Brian Masney (4):
      review-tui: show why a Patchwork update failed
      review-tui: let ApplyStateModal update other patch fields
      review: add pw_fetch_maintainers()
      review-tui: change the Patchwork delegate from the pw browser

 docs/maintainer/review.rst   |   6 +
 src/b4/review/_review.py     |  57 +++++++++
 src/b4/review_tui/_modals.py | 220 ++++++++++++++++++++++++++++++++--
 src/b4/review_tui/_pw_app.py | 165 ++++++++++++++++++++++++-
 src/tests/test_tui_pw.py     | 279 +++++++++++++++++++++++++++++++++++++++++++
 5 files changed, 718 insertions(+), 9 deletions(-)
---
base-commit: 6be7c6139d7734d84afddf989fa2874935b6d85b
change-id: 20261014-pw-delegate-b185593a1837

Best regards,
--  
Brian Masney <masneyb@kernel.org>

